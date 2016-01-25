//
//  NoteEditViewController.h
//  张睿云笔记
//
//  Created by jerry on 16-1-25.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Directory.h"
#import "Note.h"

@interface NoteEditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *toolBarView;

@property (weak, nonatomic) IBOutlet UIButton *btnReturn;
@property (weak, nonatomic) IBOutlet UIButton *btnDone;

@property (weak, nonatomic) IBOutlet UITextField *noteTitleText;

@property (weak, nonatomic) IBOutlet UITextView *noteContentTextView;

@property (weak, nonatomic) IBOutlet UIView *splitLine;

@property (nonatomic,strong) Directory * directory ;

-(void)loadData:(Note*)note;

@end
