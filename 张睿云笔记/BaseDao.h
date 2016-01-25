//
//  DBUtil.h
//  张睿云笔记
//
//  Created by jerry zhang on 16/1/10.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface BaseDao : NSObject
{
    FMDatabase * fmdb ;
}

+(instancetype)sharedInstance ;

-(NSArray*)list:(NSString*)sql ;

-(void)insert:(NSString*)insertSql arguments:(NSArray*)arguments ;

@end
