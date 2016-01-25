//
//  Directory.m
//  张睿云笔记
//
//  Created by jerry zhang on 16/1/10.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "Directory.h"

@implementation Directory

+(instancetype)getDefaultDirectory
{
    Directory * dir = [[Directory alloc] init];
    dir.directoryId = 1 ; //未分类目录
    dir.name = @"未分类" ;
    dir.parentId = 0 ;
    return dir ;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"dicrectory:id=%d,name=%@", self.directoryId,self.name];
}
-(id)copyWithZone:(NSZone *)zone
{
    Directory * temp = [[Directory alloc] init];
    temp.directoryId = self.directoryId ;
    temp.name = self.name ;
    temp.parentId = self.parentId ;
    return temp ;
}

@end
