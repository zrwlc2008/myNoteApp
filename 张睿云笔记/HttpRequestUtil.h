//
//  HttpRequestUtil.h
//  张睿云笔记
//
//  Created by jerry on 16-1-7.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequestUtil : NSObject

+(void)loginWithUsername:(NSString*)username password:(NSString*)password completion:(void (^) (BOOL isSuccess , NSString * message))completion ;

+(void)registerWithUsername:(NSString*)username password:(NSString*)password completion:(void (^) (BOOL isSuccess , NSString * message))completion ;

@end
