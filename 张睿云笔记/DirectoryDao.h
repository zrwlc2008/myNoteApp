//
//  DirectoryDao.h
//  张睿云笔记
//
//  Created by jerry zhang on 16/1/10.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DirectoryDao : NSObject

+(instancetype)sharedInstance ;

-(NSArray*)getAllDirectories ;

@end
