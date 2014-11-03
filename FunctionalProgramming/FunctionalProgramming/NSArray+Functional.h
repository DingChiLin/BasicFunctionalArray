//
//  NSArray+Functional.h
//  FunctionalProgramming
//
//  Created by Arthur Lin on 2014/11/3.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(Functional)

- (NSArray *)mapObjectsUsingBlock:(id (^)(id obj, NSUInteger idx))block;

- (NSArray *)filterObjectsUsingBlock:(BOOL (^)(id obj, NSUInteger idx))block;

- (id)reduceObjectsUsingBlock:(id (^)(id previousObj, id currentObj))block;

@end
