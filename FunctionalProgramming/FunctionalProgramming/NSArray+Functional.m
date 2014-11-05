//
//  NSArray+Functional.m
//  FunctionalProgramming
//
//  Created by Arthur Lin on 2014/11/3.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import "NSArray+Functional.h"

@implementation NSArray(Functional)

- (NSArray *)mapObjectsUsingBlock:(MapBlock)block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        [result addObject:block(obj, idx)];
        
    }];
    return result;
}


- (NSArray *)filterObjectsUsingBlock:(FilterBlock)block {
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if(block(obj, idx)){
            [result addObject:obj];
        }
    }];
    return result;
}

- (id)reduceObjectsUsingBlock:(ReduceBlock)block{
    
    __block id result = nil;
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        result = block(result,obj);
    }];
    
    return result;
    
}

const ClassFilter classFilter = ^FilterBlock(Class checkClass){
    return ^BOOL(id obj, NSUInteger idx){
        return obj != nil && [obj isKindOfClass:checkClass];
    };
};

@end





