//
//  NoteAddViewController.h
//  张睿云笔记
//
//  Created by jerry zhang on 16/1/10.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Directory.h"

@interface NoteAddViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *toolBarView;

@property (weak, nonatomic) IBOutlet UIButton *btnReturn;
@property (weak, nonatomic) IBOutlet UIButton *btnDone;

@property (weak, nonatomic) IBOutlet UITextField *noteTitleText;

@property (weak, nonatomic) IBOutlet UITextView *noteContentTextView;

@property (weak, nonatomic) IBOutlet UIView *splitLine;

@property (nonatomic,strong) Directory * directory ;

@end
