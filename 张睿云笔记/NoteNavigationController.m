//
//  NoteNavigationController.m
//  张睿云笔记
//
//  Created by jerry on 16-1-8.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "NoteNavigationController.h"
#import "NoteTableViewController.h"
#import "UIColor+HeadColor.h"

@interface NoteNavigationController ()

@end

@implementation NoteNavigationController

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
    
    
    NoteTableViewController * tableViewVC = [[NoteTableViewController alloc] initWithStyle:UITableViewStylePlain];
    tableViewVC.navigationItem.title = @"笔记列表" ;
    
    [self pushViewController:tableViewVC animated:TRUE];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
