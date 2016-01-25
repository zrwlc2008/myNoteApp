//
//  DirectoryDao.m
//  张睿云笔记
//
//  Created by jerry zhang on 16/1/10.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "DirectoryDao.h"
#import "Directory.h"
#import "BaseDao.h"

static DirectoryDao * instance ;

@implementation DirectoryDao

+(instancetype)sharedInstance
{
    @synchronized(self){
        if(!instance){
            instance = [[DirectoryDao alloc] init];
        }
    }
    return instance ;
}

+(id)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self){
        if(!instance){
            instance = [super allocWithZone:zone];;
        }
    }
    return instance ;
}

//按分页获取记录
-(NSArray*)getAllDirectories
{
    NSArray * result = [[BaseDao sharedInstance] list:@"SELECT * FROM tb_directory"];
    
    NSMutableArray * array = [[NSMutableArray alloc] init];
    
    for (NSDictionary * dict in result) {
        
        Directory * dir = [[Directory alloc] init];
        
        dir.directoryId = [[dict objectForKey:@"id"] intValue];
        dir.name = [[dict objectForKey:@"name"] stringValue];
        
        [array addObject:dir];
    }
    
    return array ;
}

@end
