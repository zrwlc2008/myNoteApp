//
//  LoginNavigationController.m
//  张睿云笔记
//
//  Created by jerry on 16-1-7.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "LoginNavigationController.h"
#import "LoginViewController.h"
#import "UIColor+HeadColor.h"

@interface LoginNavigationController ()

@end

@implementation LoginNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //设置navigationBar颜色
    [self.navigationBar setBarTintColor:[UIColor headColor]];
    
    //设置navigationBar字的颜色
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
    
    //设置navigationBar上各个barItem的字体颜色（是通过tineColor透上来的）
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    
    LoginViewController * loginVC = [[LoginViewController alloc] init];
    loginVC.navigationItem.title = @"登录" ;
    [self pushViewController:loginVC animated:TRUE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
