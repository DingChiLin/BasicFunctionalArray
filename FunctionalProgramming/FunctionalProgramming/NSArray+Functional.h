
//  NSArray+Functional.h
//  FunctionalProgramming
//
//  Created by Arthur Lin on 2014/11/3.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(Functional)

typedef id (^MapBlock)(id obj, NSUInteger idx);
typedef BOOL (^FilterBlock)(id obj, NSUInteger idx);
typedef id (^ReduceBlock)(id result, id obj);
typedef FilterBlock(^ClassFilter)(Class checkClass);

- (NSArray *)mapObjectsUsingBlock:(MapBlock)block;

- (NSArray *)filterObjectsUsingBlock:(FilterBlock)block;

- (id)reduceObjectsUsingBlock:(ReduceBlock)block;

extern const ClassFilter classFilter;

@end


