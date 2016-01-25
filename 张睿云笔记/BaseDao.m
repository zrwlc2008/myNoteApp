//
//  DBUtil.m
//  张睿云笔记
//
//  Created by jerry zhang on 16/1/10.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "BaseDao.h"
#import "Constant.h"

//定义现在bundle包中的db版本号
static const float dbVersion = 1.4 ;
static BaseDao * instance ;

@implementation BaseDao

+(instancetype)sharedInstance
{
    @synchronized(self){
        if(!instance){
            instance = [[BaseDao alloc] init];
        }
    }
    return instance ;
}

+(id)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self){
        if(!instance){
            instance = [super allocWithZone:zone];
        }
    }
    return instance ;
}

-(id)init
{
    if(self = [super init]){
        
        //初始化fmdb
        //获取沙盒路径
        NSString * sandboxPath = NSHomeDirectory();
        //NSLog(@"沙盒路径 = %@",sandboxPath);
        
        //获取Documents路径 方法1
        NSString * documentsPath = [sandboxPath stringByAppendingPathComponent:@"Documents"];
        //NSLog(@"Documents路径-方法1 = %@",documentsPath);
        
        NSString * dbBundlePath = [[NSBundle mainBundle] pathForResource:@"notes" ofType:@".sqlite"];
        
        NSString * dbDocumensPath = [documentsPath stringByAppendingPathComponent:@"notes.sqlite"];

        NSFileManager * fileManager = [NSFileManager defaultManager];
        NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
        
        //获取手机上当前db的版本号
        NSNumber * oldDBVersion = [userDefaults objectForKey:CONST_DB_VERSION];
        
        NSLog(@"dbDocumensPath = %@ , 手机db版本=%f , 当前db版本=%f", dbDocumensPath , [oldDBVersion floatValue] , dbVersion);

        //如果手机上db版本较低
        if([oldDBVersion floatValue] < dbVersion ||
           [fileManager fileExistsAtPath:dbDocumensPath] == FALSE){
            
            NSLog(@"检测到需要更新数据库...");
            
            __autoreleasing NSError * error = [[NSError alloc] init];
            
            //将bundle包中的db拷贝到documents，进行db更新
            BOOL b = [fileManager copyItemAtPath:dbBundlePath toPath:dbDocumensPath error:&error];
            
            if(b){
                
                NSLog(@"更新数据库成功！");
                
                //如果拷贝成功，将新版本号存入userDefaults
                [userDefaults setObject:[NSNumber numberWithFloat:dbVersion] forKey:CONST_DB_VERSION];
                [userDefaults synchronize];
            }
            else{
                
                NSLog(@"数据库更新失败：error=%@" , [error localizedDescription]);
            }
        }
        
        //打开documents中的db
        fmdb = [FMDatabase databaseWithPath:dbDocumensPath];
        
    }
    return self ;
}

-(NSArray*)list:(NSString*)sql
{
    
    NSMutableArray * array = [[NSMutableArray alloc] init];
    
    if([fmdb open]){
        //查询
        FMResultSet * result = [fmdb executeQuery:sql];
        
        int colunmCount = [result columnCount];
        
        while ([result next]) {
            
            NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
            
            for (int i = 0 ; i < colunmCount ; i++) {
                
                NSString * colName = [result columnNameForIndex:i];
                id colValue = [result objectForColumnIndex:i];
                
                [dict setObject:colValue forKey:colName];
                
            }
            
            [array addObject:dict];
            
        }
        
        [fmdb close];
        
    }
    
    return array ;
}

-(void)insert:(NSString*)insertSql arguments:(NSArray*)arguments
{
    if ([fmdb open]) {
        [fmdb executeUpdate:insertSql withArgumentsInArray:arguments];
        long long idd = [fmdb lastInsertRowId];
        NSLog(@"%lld",idd);
    }
}

@end
