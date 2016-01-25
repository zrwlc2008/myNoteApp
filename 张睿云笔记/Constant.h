//
//  GlobalKeys.h
//  张睿云笔记
//
//  Created by jerry on 16-1-7.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import <Foundation/Foundation.h>

//int x = 10 ;
//const int * p = &x ; //1. const在*左边，就是常量指针，不能通过其改变值，但可以改变其指向
////*p = 20 ; //通过其修改值，报错
//int y = 20 ;
//p = &y ;    //可以改变指向
//const int z = 30 ;
//p = &z ;    //可以指向常量
//
//
//int const * p3 = &x ;  //2. type const * 也是常量指针
////*p3 = 50 ; //通过其修改值，报错
//
//
//int * const p2 = &x ; //3. const在*右边，就是(变量)指针常量，即只能指向变量，可以通过其改变值，但不能改变其指向
////p2 = &y ;  //改变其指向，报错
//*p2 = 40 ;
//printf("z=%d",z);  //不能指向常量

UIKIT_EXTERN NSString *const CONST_USERNAME_KEY ;
UIKIT_EXTERN NSString *const CONST_LOGIN_URL ;
UIKIT_EXTERN NSString *const CONST_REGISTER_URL ;
UIKIT_EXTERN NSString *const CONST_DB_VERSION ;
