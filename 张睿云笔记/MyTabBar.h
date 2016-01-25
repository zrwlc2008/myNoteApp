//
//  MyTabBar.h
//  IOS第十六天-自定义TabBar
//
//  Created by jerry on 16-1-6.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "UIButton+DoNothingWhenHighlight.h"

@class MyTabBar ;

//委托协议
@protocol MyTabBarDelegate <NSObject>
- (void) addButtonClicked:(MyTabBar *)tabBar ;
- (void) tabBar:(MyTabBar *)tabBar selectedFrom:(NSInteger)from to:(NSInteger)to;
@end


//类
@interface MyTabBar : UIView
{
    NSArray * viewControllers ;
    NSArray * tabButtons ;
}
@property(nonatomic,weak) id<MyTabBarDelegate> delegate;
@property (nonatomic,strong) UIButton * selectedButton ;

@property (weak, nonatomic) IBOutlet UIButton *btnList;
@property (weak, nonatomic) IBOutlet UIButton *btnCategory;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UIButton *btnGroup;
@property (weak, nonatomic) IBOutlet UIButton *btnSetting;


+(instancetype)loadTabBarFromNib ;

@end
