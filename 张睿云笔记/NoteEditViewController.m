//
//  NoteEditViewController.m
//  张睿云笔记
//
//  Created by jerry on 16-1-25.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "NoteEditViewController.h"
#import "UIViewController+Alert.h"
#import "NoteDataService.h"
#import "UIColor+HeadColor.h"

@interface NoteEditViewController () <UITextFieldDelegate,UITextViewDelegate>

@end

@implementation NoteEditViewController

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

-(void)loadData:(Note *)note
{
    
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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
