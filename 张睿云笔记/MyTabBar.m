//
//  MyTabBar.m
//  IOS第十六天-自定义TabBar
//
//  Created by jerry on 16-1-6.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "MyTabBar.h"
#define tagBase 10

@implementation MyTabBar

+(instancetype)loadTabBarFromNib
{
    NSArray * array = [[NSBundle mainBundle] loadNibNamed:@"MyTabBarView" owner:nil options:nil];
    MyTabBar * tb = [array firstObject];
    return tb ;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //NSLog(@"keyPath=%@ , object=%@ , change=%@ , context=%@ ", keyPath,object,change,context);
    
    if([keyPath isEqualToString:@"viewControllers"]){
        viewControllers = change[@"new"];
        [self setButtons];
    }
    if([keyPath isEqualToString:@"selectedIndex"]){
        int newIndex = [change[@"new"] intValue];
        //如果是tabBarControll通过修改selectedIndex来切换页面，则tabBar直接切换选择按钮状态
        if(newIndex + tagBase != self.btnAdd.tag){
            [self changeSelectedButtonImageForOtherButtons:(UIButton*)[self viewWithTag:newIndex + tagBase]];
        }
    }
}

-(void)setButtons
{
    if(viewControllers && viewControllers.count == 5){
        
        self.btnList.tag = tagBase ;
        self.btnCategory.tag = 1 + tagBase ;
        self.btnGroup.tag = 2 + tagBase ;
        self.btnSetting.tag = 3 + tagBase ;
        self.btnAdd.tag = 999 ;
        
        [self.btnAdd setBackgroundImage:[UIImage imageNamed:@"tabbar_add_btns.png"] forState:UIControlStateNormal];
        [self.btnAdd setBackgroundImage:[UIImage imageNamed:@"tabbar_add_dis_btns.png"] forState:UIControlStateSelected];
        
        //点击添加按钮
        [self.btnAdd addTarget:self action:@selector(clickAddBtn) forControlEvents:UIControlEventTouchUpInside];
        
    
        //添加按钮不在tabButton之列，点击它需要弹出一个新页面
        tabButtons = [NSArray arrayWithObjects:self.btnList,self.btnCategory,self.btnGroup,self.btnSetting, nil];
        
        for (UIButton * btn in tabButtons) {
            [btn addTarget:self action:@selector(clickTabBtn:) forControlEvents:UIControlEventTouchUpInside];
        }
        
    }
    
}

-(void)clickAddBtn
{
    //NSLog(@"addBtnTouchUp");
    
    [self.delegate addButtonClicked:self];
    
}

/**
 *  自定义TabBar的按钮点击事件
 */
- (void)clickTabBtn:(UIButton *)button {
    
    //避免单个按钮重复点击
    if (button == self.selectedButton) {
        return ;
    }
    
    //记录选中按钮
    UIButton * prevSelectedButton = self.selectedButton ;
    self.selectedButton = button;
    
    [self changeSelectedButtonImageForOtherButtons:button];

    //NSLog(@"old %d",self.selectedButton.tag);
    //NSLog(@"new %d",button.tag);
    
    //切换视图控制器的事情,应该交给controller来做
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBar:selectedFrom:to:)]) {
        [self.delegate tabBar:self selectedFrom:prevSelectedButton.tag-tagBase to:button.tag-tagBase];
    }
    
}

-(void)changeSelectedButtonImageForOtherButtons:(UIButton*)selectedButton
{
    //改换选中按钮效果图
    for (UIButton * btn in tabButtons) {
        [btn setBackgroundImage:nil forState:UIControlStateNormal];
    }
    [selectedButton setBackgroundImage:[UIImage imageNamed:@"select.png"] forState:UIControlStateNormal];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
