//
//  NoteAddViewController.m
//  张睿云笔记
//
//  Created by jerry zhang on 16/1/10.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "NoteAddViewController.h"
#import "UIViewController+Alert.h"
#import "Note.h"
#import "Directory.h"
#import "NoteDataService.h"
#import "UIColor+HeadColor.h"

@interface NoteAddViewController () <UITextFieldDelegate,UITextViewDelegate>

@end

@implementation NoteAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toolBarView.backgroundColor = [UIColor headColor];
    
    self.splitLine.backgroundColor = [UIColor lightGrayColor];
    
    self.noteTitleText.delegate = self ;
    self.noteContentTextView.delegate = self ;

    self.noteTitleText.placeholder = @"请填写标题" ;
    self.noteTitleText.borderStyle = UITextBorderStyleNone ;
    
    self.noteTitleText.returnKeyType = UIReturnKeyNext ;
    self.noteContentTextView.returnKeyType = UIReturnKeyDone ;
    
    self.noteTitleText.keyboardType = UIKeyboardTypeDefault ;
    self.noteContentTextView.keyboardType = UIKeyboardTypeDefault ;
    
    [self.btnReturn addTarget:self action:@selector(returnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.btnDone addTarget:self action:@selector(doneClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}

#pragma mark - 按钮事件
-(void)returnClick
{
    [self dismissViewControllerAnimated:TRUE completion:^{}];
}

-(void)doneClick
{
    NSString * title = [self.noteTitleText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString * content = [self.noteContentTextView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if([title isEqualToString:@""]){
        [self alert:@"请输入标题"] ;
        return ;
    }
    
    [[NoteDataService sharedInstance] addNoteWithTitle:title content:content directory:self.directory];
    
    [self dismissViewControllerAnimated:TRUE completion:^{}];
    
}

#pragma mark 按钮事件 end



#pragma mark - other
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
