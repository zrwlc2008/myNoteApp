//
//  NSObject (IsNotNull).m
//  张睿云笔记
//
//  Created by jerry zhang on 16/1/10.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "NSObject+IsNotNull.h"

@implementation NSObject (IsNotNull)

-(BOOL)isNotNull
{
    return self != nil
        && [self isEqual:[NSNull null]] == FALSE
        && [self isEqual:nil] == FALSE ;
}

-(BOOL)isNull
{
    return self == nil
    || [self isEqual:[NSNull null]]
    || [self isEqual:nil];
}

@end
