//
//  User.m
//  FunctionalProgramming
//
//  Created by Arthur Lin on 2014/11/5.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import "User.h"

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