//
//  AppDelegate.m
//  张睿云笔记
//
//  Created by jerry on 16-1-4.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginNavigationController.h"
#import "Constant.h"
#import "IndexTabBarViewController.h"
#import "BaseDao.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
//    LoginNavigationController * loginNavi = [[LoginNavigationController alloc] init];
//    self.window.rootViewController = loginNavi ;
    
    IndexTabBarViewController * indexVC = [[IndexTabBarViewController alloc] init];
    self.window.rootViewController = indexVC ;
    
    /*
    //测试单例地址
    BaseDao * dao = [BaseDao sharedInstance];
    BaseDao * dao2 = [[BaseDao alloc] init];
    BaseDao * dao3 = [[BaseDao alloc] init];
    NSLog(@"1=%@ , 2=%@ , 3=%@",dao,dao2,dao3);
    */
     
    /*
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    //[defaults removeObjectForKey:CONST_USERNAME_KEY];
    //[defaults synchronize];
    
    id username = [defaults objectForKey:CONST_USERNAME_KEY];//根据指定的键获取对应的值
    
    if (username) {
        NSLog(@"用户已经登录过 %@",username);
        
        IndexTabBarViewController * indexVC = [[IndexTabBarViewController alloc] init];
        self.window.rootViewController = indexVC ;
        
    }
    //用户未登录则显示登录页面
    else {
        
        LoginNavigationController * loginNavi = [[LoginNavigationController alloc] init];
        self.window.rootViewController = loginNavi ;
    }
    */
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
