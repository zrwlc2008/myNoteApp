//
//  MyTabBarViewController.m
//  IOS第十六天-自定义TabBar
//
//  Created by jerry on 16-1-6.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "IndexTabBarViewController.h"
#import "MyTabBar.h"
#import "NoteNavigationController.h"
#import "NoteTableViewController.h"
#import "NoteAddViewController.h"

#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"

#define tabBarHeight 90

@interface IndexTabBarViewController () <MyTabBarDelegate>

@end

@implementation IndexTabBarViewController

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
    
    // Do any additional setup after loading the view.
    
    self.tabBar.hidden = YES ;
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size ;
    
    myTabBar = [MyTabBar loadTabBarFromNib];
    myTabBar.delegate = self;
    myTabBar.frame = CGRectMake(0, screenSize.height - tabBarHeight , screenSize.width , tabBarHeight);
    [self.view addSubview:myTabBar];
    
    [self addObserver:myTabBar forKeyPath:@"viewControllers" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:myTabBar forKeyPath:@"selectedIndex" options:NSKeyValueObservingOptionNew context:nil];
    
    //笔记导航部分（列表 NoteTabelVC + 编辑 NoteEditVC ）
    //NoteTableViewVC的初始化在naviVC的init方法里
    NoteNavigationController * noteNaviVC = [[NoteNavigationController alloc] init];
    
    
    TwoViewController * twoVC = [[TwoViewController alloc] init];
    ThreeViewController * threeVC = [[ThreeViewController alloc] init];
    FourViewController * fourVC = [[FourViewController alloc] init];
    FiveViewController * fiveVC = [[FiveViewController alloc] init];
    
    NSArray * subVCArray = [NSArray arrayWithObjects:noteNaviVC,twoVC,threeVC,fourVC,fiveVC, nil];
    
    [self setViewControllers:subVCArray];
    
    self.selectedIndex = 0 ;
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

#pragma mark - MyTabBarDelegate 方法

- (void) addButtonClicked:(MyTabBar *)tabBar
{
    NoteAddViewController * addVC = [[NoteAddViewController alloc] init];
    [self presentViewController:addVC animated:TRUE completion:^{}];
}

-(void)tabBar:(MyTabBar *)tabBar selectedFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to ;
    
}
#pragma mark MyTabBarDelegate 方法

@end
