//
//  FunctionalProgrammingTests.m
//  FunctionalProgrammingTests
//
//  Created by Arthur Lin on 2014/11/3.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSArray+Functional.h"
#import "User.h"

@interface FunctionalProgrammingTests : XCTestCase{
    User *user1;
    User *user2;
    User *user3;
}

@end

@implementation FunctionalProgrammingTests

- (void)setUp {
    [super setUp];
    
    user1 = [[User alloc]initWithUserName:@"Arthur" andAge:11];
    user2 = [[User alloc]initWithUserName:@"Molly" andAge:22];
    user3 = [[User alloc]initWithUserName:@"Upton" andAge:33];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    user1 = nil;
    user2 = nil;
    user3 = nil;
    
    [super tearDown];
}

/**
 *   Map
 */

- (void)testMapStringArray{
    
    NSArray *testArr = [NSArray arrayWithObjects: @"Arthur", @"Molly", @"Upton", nil];
    
    NSArray *result = [testArr mapObjectsUsingBlock:^id(id obj, NSUInteger idx){
        return [NSString stringWithFormat:@"%lu,%lu",(unsigned long)[obj length],(unsigned long)idx];
    }];
    
    NSArray *expect = [NSArray arrayWithObjects: @"6,0", @"5,1", @"5,2", nil];
    
    XCTAssertEqualObjects(result, expect);
    
}

- (void)testMapObjectArray{
    
    NSArray *testArr = [NSArray arrayWithObjects: user1, user2, user3, nil];
    
    NSArray *result = [testArr mapObjectsUsingBlock:^id(id obj, NSUInteger idx){
        return [obj name];
    }];
    
    NSArray *expect = [NSArray arrayWithObjects: @"Arthur", @"Molly", @"Upton", nil];
    
    XCTAssertEqualObjects(result, expect);
}

/**
 *  Filter
 */

- (void)testFilterStringArray{

    NSArray *testArr = [NSArray arrayWithObjects: @"Arthur", @"Molly", @"Upton", nil];
    
    NSArray *result = [testArr filterObjectsUsingBlock:^BOOL(id object, NSUInteger idx){
        return [object length] <= 5;
    }];
    
    NSArray *expect = [NSArray arrayWithObjects:@"Molly", @"Upton", nil];
    
    XCTAssertEqualObjects(result, expect);
}

- (void)testFilterObjectArray{

    NSArray *testArr2 = [NSArray arrayWithObjects: user1, user2, user3, nil];
    NSArray *result = [testArr2 filterObjectsUsingBlock:^BOOL(id obj, NSUInteger idx){
        return [obj name].length <= 5;
    }];
    
    NSArray *expect = [NSArray arrayWithObjects:user2, user3, nil];
    
    XCTAssertEqualObjects(result, expect);

}

/**
 *  Reduce
 */

- (void)testReduceStringArray{
    
    NSArray *testArr = [NSArray arrayWithObjects: @11, @22, @33, nil];
    NSArray *result = [testArr reduceObjectsUsingBlock:^id(id result, id obj){
        return [NSNumber numberWithDouble:[result doubleValue] + [obj doubleValue]];
    }];
    
    NSNumber *expect = @66;
    
    XCTAssertEqualObjects(result, expect);
}

- (void)testReduceObjectArrayToNumber{
    
    NSArray *testArr = [NSArray arrayWithObjects: user1, user2, user3, nil];
    NSArray *result = [testArr reduceObjectsUsingBlock:^id(id result, id obj){
        return [NSNumber numberWithDouble:[result doubleValue] + [obj age]];
    }];
    
    NSNumber *expect = @66;
    
    XCTAssertEqualObjects(result, expect);
    
}

- (void)testReduceObjectArrayToString{
    NSArray *testArr3 = [NSArray arrayWithObjects: user1, user2, user3, nil];
    NSArray *result = [testArr3 reduceObjectsUsingBlock:^id(id result, id obj){
        if(result == nil){
            return [obj name];
        }else{
            return [NSString stringWithFormat:@"%@,%@",result,[obj name]];
        }
    }];
    
    NSString *expect = @"Arthur,Molly,Upton";
    
    XCTAssertEqualObjects(result, expect);
}

/**
 *  Higher-Order Function
 */

- (void)testClassFilterCanFindChoosenObjectInArray{
    
    //String
    NSArray *testArr = [NSArray arrayWithObjects: @"Arthur",@11, @"Molly",@22, @"Upton", nil];
    
    NSArray *result = [testArr filterObjectsUsingBlock:
        classFilter([NSString class])
    ];
    
    NSArray *expect = [NSArray arrayWithObjects: @"Arthur", @"Molly", @"Upton", nil];
    
    XCTAssertEqualObjects(expect, result);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
