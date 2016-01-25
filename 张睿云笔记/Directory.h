//
//  Directory.h
//  张睿云笔记
//
//  Created by jerry zhang on 16/1/10.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Directory : NSObject <NSCopying>

@property (nonatomic,assign) int directoryId ;
@property (nonatomic,copy) NSString * name ;
@property (nonatomic,assign) int parentId ;

+(instancetype)getDefaultDirectory ;

@end
