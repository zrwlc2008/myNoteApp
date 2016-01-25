//
//  HttpRequestUtil.m
//  张睿云笔记
//
//  Created by jerry on 16-1-7.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "HttpRequestUtil.h"
#import "ASIFormDataRequest.h"
#import "GDataXMLNode.h"
#import "Constant.h"

//static HttpRequestUtil * instance ;

@implementation HttpRequestUtil

//+(instancetype)sharedInstance
//{
//    @synchronized(self){
//        if(!instance){
//            instance = [[HttpRequestUtil alloc] init];
//        }
//    }
//    return instance ;
//}
//
//+(id)allocWithZone:(struct _NSZone *)zone
//{
//    @synchronized(self){
//        if(!instance){
//            instance = [super allocWithZone:zone];;
//        }
//    }
//    return instance ;
//}

//提交登录请求
+(void)loginWithUsername:(NSString*)username password:(NSString*)password completion:(void (^) (BOOL isSuccess , NSString * message))completion
{
    BOOL isSuccess = FALSE ;
    NSString * message = nil ;
    
    ASIFormDataRequest* request = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:CONST_LOGIN_URL]];
    [request setPostValue:username forKey:@"user_name"];
    [request setPostValue:password forKey:@"user_password"];
    
    //同步请求
    [request startSynchronous];
    if (![request error]) {
        //NSString* str = [request responseString];
        //NSLog(@"loginWithUsername --- responseString:%@",str);
        
        //解析xml
        NSData * data = [request responseData];
        
        /*
         成功
         <?xml version="1.0" encoding="utf-8"?>
         <root>
         <status>1</status>
         <message></message>
         <errorCode>0</errorCode>
         <data>
            <user_id>11421</user_id>
            <user_name>zhangrui</user_name>
            <session_id>u4ugcf3hlr63p2ocfitfh75f64</session_id>
         </data>
         </root>

         失败
         <?xml version="1.0" encoding="utf-8"?>
         <root>
         <status>0</status>
         <message>失败信息</message>
         <errorCode>0</errorCode>
         <data/>
         </root>
         */
        
        __autoreleasing NSError * error = [[NSError alloc] init] ;
        
        GDataXMLDocument * doc = [[GDataXMLDocument alloc]initWithData:data options:0 error:&error];
        GDataXMLElement * root = [doc rootElement];
        
        GDataXMLElement * statusNode = [[root nodesForXPath:@"status" error:&error] firstObject];
        
        NSString * statusString = [statusNode stringValue];
        
        if([statusString isEqualToString:@"1"]){
            
            GDataXMLElement * usernameNode = [[root nodesForXPath:@"data/user_name" error:&error] firstObject];
            
            NSString * usernameString = [usernameNode stringValue];
            
            isSuccess = [usernameString isEqualToString:username] ? TRUE : FALSE ;
        }
        else{
            isSuccess = FALSE ;
            
            GDataXMLElement * messageNode = [[root nodesForXPath:@"message" error:&error] firstObject];
            
            message = [messageNode stringValue];
        }
        
    }
    else
    {
        NSLog(@"loginWithUsername --- error:%@", [[request error] localizedDescription]);
        isSuccess = FALSE ;
        NSError * error = [request error];
        message = [error localizedDescription];
    }
    
    //执行回调块
    completion(isSuccess,message);
}

//提交登录请求
+(void)registerWithUsername:(NSString*)username password:(NSString*)password completion:(void (^) (BOOL isSuccess , NSString * message))completion
{
    BOOL isSuccess = FALSE ;
    NSString * message = nil ;
    
    ASIFormDataRequest* request = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:CONST_REGISTER_URL]];
    
    [request setPostValue:username forKey:@"user_name"];
    [request setPostValue:password forKey:@"user_password"];
    
    //同步请求
    [request startSynchronous];
    if (![request error]) {
        //NSString* str = [request responseString];
        //NSLog(@"loginWithUsername --- responseString:%@",str);
        //解析xml
        NSData * data = [request responseData];
        
        /*
         成功
         <?xml version="1.0" encoding="utf-8"?>
         <root>
         <status>1</status>
         <message></message>
         <errorCode>0</errorCode>
         <data>
            <user_id>newid</user_id>
         </data>
         </root>
         
         失败
         <?xml version="1.0" encoding="utf-8"?>
         <root>
         <status>0</status>
         <message>失败信息</message>
         <errorCode>0</errorCode>
         <data/>
         </root>
         */
        __autoreleasing NSError * error = [[NSError alloc] init] ;
        
        GDataXMLDocument * doc = [[GDataXMLDocument alloc]initWithData:data options:0 error:&error];
        GDataXMLElement * root = [doc rootElement];
        
        GDataXMLElement * statusNode = [[root nodesForXPath:@"status" error:&error] firstObject];
        
        NSString * statusString = [statusNode stringValue];
        
        if([statusString isEqualToString:@"1"]){
            
            GDataXMLElement * useridNode = [[root nodesForXPath:@"data/user_id" error:&error] firstObject];
            
            NSString * useridString = [useridNode stringValue];
            
            if(useridString.length > 0){
                isSuccess = TRUE ;
            }
        }
        else{
            
            isSuccess = FALSE ;
            
            GDataXMLElement * messageNode = [[root nodesForXPath:@"message" error:&error] firstObject];
            
            message = [messageNode stringValue];
            
        }
    }
    else
    {
        NSLog(@"registerWithUsername --- error:%@", [[request error] localizedDescription]);
        
        isSuccess = FALSE ;
        
        NSError * error = [request error];
        message = [error localizedDescription];
    }
    
    //执行回调块
    completion(isSuccess,message);
}

@end
