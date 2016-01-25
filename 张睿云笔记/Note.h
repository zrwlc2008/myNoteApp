//
//  Note.h
//  张睿云笔记
//
//  Created by jerry on 16-1-8.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Directory.h"

@interface Note : NSObject

@property (nonatomic,assign) int noteId ;
@property (nonatomic,copy) NSString * title ;
@property (nonatomic,copy) NSData * contentData ;
@property (nonatomic,copy) Directory * directory ;
@property (nonatomic,copy) NSString * createDatetime ;


@end
