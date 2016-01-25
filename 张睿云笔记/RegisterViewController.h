//
//  RegisterViewController.h
//  张睿云笔记
//
//  Created by jerry on 16-1-7.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textUsername;
@property (weak, nonatomic) IBOutlet UITextField *textPassword;
@property (weak, nonatomic) IBOutlet UITextField *textConfirmPass;
@property (weak, nonatomic) IBOutlet UIButton *btnRegister;
@end
