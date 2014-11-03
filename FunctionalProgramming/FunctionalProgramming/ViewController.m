//
//  ViewController.m
//  FunctionalProgramming
//
//  Created by Arthur Lin on 2014/11/3.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Functional.h"

@interface User:NSObject

@property(nonatomic,retain)NSString *name;
@property(nonatomic,assign)int age;

-(id)initWithUserName:(NSString *)name andAge:(int)age;

@end

@implementation User

-(id)initWithUserName:(NSString *)name andAge:(int)age{
    
    self = [super init];
    if(self){
        self.name = name;
        self.age = age;
    }
    return self;
}

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  Data Define
     */
    
    User *user1 = [[User alloc]initWithUserName:@"Arthur" andAge:26];
    User *user2 = [[User alloc]initWithUserName:@"Molly" andAge:25];
    User *user3 = [[User alloc]initWithUserName:@"Upton" andAge:28];
    
    /**
     *   Map
     */
    
    // String
    NSArray *mArr = [NSArray arrayWithObjects: @"Arthur", @"Molly", @"Upton", nil];
    
    mArr = [mArr mapObjectsUsingBlock:^id(id obj, NSUInteger idx){
        return [NSString stringWithFormat:@"%lu,%lu",(unsigned long)[obj length],(unsigned long)idx];
    }];
    
    NSLog(@"%@",mArr);
    
    // Object
    NSArray *mArr2 = [NSArray arrayWithObjects: user1, user2, user3, nil];
    
    mArr2 = [mArr2 mapObjectsUsingBlock:^id(id obj, NSUInteger idx){
        return [obj name];
    }];
    
    NSLog(@"%@",mArr2);
    
    /**
     *  Filter
     */
    
    //String
    NSArray *fArr = [NSArray arrayWithObjects: @"Arthur", @"Molly", @"Upton", nil];
    fArr = [fArr filterObjectsUsingBlock:^BOOL(id object, NSUInteger idx){
        return [object length] <= 5;
    }];
    NSLog(@"%@",fArr);
    
    //Object
    NSArray *fArr2 = [NSArray arrayWithObjects: user1, user2, user3, nil];
    fArr2 = [fArr2 filterObjectsUsingBlock:^BOOL(id obj, NSUInteger idx){
        return [obj name].length <= 5;
    }];
    for(User *user in fArr2){
        NSLog(@"%@",user.name);
    }
    
    /**
     *  Reduce
     */
    
    //Number
    NSArray *rArr = [NSArray arrayWithObjects: @11, @22, @33, nil];
    rArr = [rArr reduceObjectsUsingBlock:^id(id result, id obj){
        return [NSNumber numberWithDouble:[result doubleValue] + [obj doubleValue]];
    }];
    NSLog(@"%@",rArr);
    
    //Object
    NSArray *rArr2 = [NSArray arrayWithObjects: user1, user2, user3, nil];
    rArr2 = [rArr2 reduceObjectsUsingBlock:^id(id result, id obj){
        return [NSNumber numberWithDouble:[result doubleValue] + [obj age]];
    }];
    NSLog(@"%@",rArr2);
    
    //Object
    NSArray *rArr3 = [NSArray arrayWithObjects: user1, user2, user3, nil];
    rArr3 = [rArr3 reduceObjectsUsingBlock:^id(id result, id obj){
        if(result == nil){
            return [obj name];
        }else{
            return [NSString stringWithFormat:@"%@,%@",result,[obj name]];
        }
    }];
    NSLog(@"%@",rArr3);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
