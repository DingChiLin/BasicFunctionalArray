//
//  NSArray+Functional.m
//  FunctionalProgramming
//
//  Created by Arthur Lin on 2014/11/3.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import "NSArray+Functional.h"

@implementation NSArray(Functional)

- (NSArray *)mapObjectsUsingBlock:(id (^)(id obj, NSUInteger idx))block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [result addObject:block(obj, idx)];
    }];
    return result;
}


- (NSArray *)filterObjectsUsingBlock:(BOOL (^)(id obj, NSUInteger idx))block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if(block(obj, idx)){
            [result addObject:obj];
        }
    }];
    return result;
}

- (id)reduceObjectsUsingBlock:(id (^)(id previousObj, id currentObj))block{

    __block id result = nil;
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        result = block(result,obj);
        
    }];
    
    return result;
    
}


@end
