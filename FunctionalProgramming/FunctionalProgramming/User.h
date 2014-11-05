//
//  User.h
//  FunctionalProgramming
//
//  Created by Arthur Lin on 2014/11/5.
//  Copyright (c) 2014年 Arthur Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User:NSObject

@property(nonatomic,retain)NSString *name;
@property(nonatomic,assign)int age;

-(id)initWithUserName:(NSString *)name andAge:(int)age;

@end
