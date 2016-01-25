//
//  RegisterViewController.m
//  张睿云笔记
//
//  Created by jerry on 16-1-7.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "RegisterViewController.h"
#import "HttpRequestUtil.h"
#import "UIViewController+Alert.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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

    //委托
    self.textUsername.delegate = self ;
    self.textPassword.delegate = self ;
    self.textConfirmPass.delegate = self ;
    
    self.textUsername.placeholder = @"字母、数字、下划线,6-20位";
    self.textPassword.placeholder = @"字母、数字、下划线,6-20位";
    self.textConfirmPass.placeholder = @"请再次输入密码" ;
    
    //设为密码框
    self.textPassword.secureTextEntry = TRUE ;
    self.textConfirmPass.secureTextEntry = TRUE ;
    
    //圆角
    self.textUsername.borderStyle = UITextBorderStyleRoundedRect ;
    self.textPassword.borderStyle = UITextBorderStyleRoundedRect ;
    self.textConfirmPass.borderStyle = UITextBorderStyleRoundedRect ;
    
    //键盘类型
    self.textUsername.keyboardType = UIKeyboardTypeDefault ;
    self.textPassword.keyboardType = UIKeyboardTypeDefault ;
    self.textConfirmPass.keyboardType = UIKeyboardTypeDefault ;
    
    //return键类型
    self.textUsername.returnKeyType = UIReturnKeyNext ;
    self.textPassword.returnKeyType = UIReturnKeyNext ;
    self.textConfirmPass.returnKeyType = UIReturnKeyDone ;
    
    //username leftview
    UILabel *usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    usernameLabel.text = @"账号:" ;
    usernameLabel.textColor = [UIColor grayColor];
    usernameLabel.textAlignment = NSTextAlignmentRight ;
    self.textUsername.leftView = usernameLabel ;
    self.textUsername.leftViewMode = UITextFieldViewModeAlways ;
    
    //username rightview
    UIButton *clearUsername = [UIButton buttonWithType:UIButtonTypeCustom];
    clearUsername.frame = CGRectMake(0, 0, 20, 12);
    [clearUsername setImage:[UIImage imageNamed:@"clear_text"] forState:UIControlStateNormal];
    [clearUsername setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 8)];
    clearUsername.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft ;
    [clearUsername addTarget:self action:@selector(clearUsername) forControlEvents:UIControlEventTouchUpInside];
    self.textUsername.rightView = clearUsername ;
    self.textUsername.rightViewMode = UITextFieldViewModeWhileEditing ;
    
    //password leftview
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    passwordLabel.text = @"密码:" ;
    passwordLabel.textColor = [UIColor grayColor];
    passwordLabel.textAlignment = NSTextAlignmentRight ;
    self.textPassword.leftView = passwordLabel ;
    self.textPassword.leftViewMode = UITextFieldViewModeAlways ;
    
    //password rightview
    UIButton *clearPassword = [UIButton buttonWithType:UIButtonTypeCustom];
    clearPassword.frame = CGRectMake(0, 0, 20, 12);
    [clearPassword setImage:[UIImage imageNamed:@"clear_text"] forState:UIControlStateNormal];
    [clearPassword setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 8)];
    clearPassword.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft ;
    [clearPassword addTarget:self action:@selector(clearPassowrd) forControlEvents:UIControlEventTouchUpInside];
    self.textPassword.rightView = clearPassword ;
    self.textPassword.rightViewMode = UITextFieldViewModeWhileEditing ;
    
    //confirmpass leftview
    UILabel *confirmPassLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    confirmPassLabel.text = @"确认:" ;
    confirmPassLabel.textColor = [UIColor grayColor];
    confirmPassLabel.textAlignment = NSTextAlignmentRight ;
    self.textConfirmPass.leftView = confirmPassLabel ;
    self.textConfirmPass.leftViewMode = UITextFieldViewModeAlways ;
    
    //confirmpass rightview
    UIButton *clearConfirmPass = [UIButton buttonWithType:UIButtonTypeCustom];
    clearConfirmPass.frame = CGRectMake(0, 0, 20, 12);
    [clearConfirmPass setImage:[UIImage imageNamed:@"clear_text"] forState:UIControlStateNormal];
    [clearConfirmPass setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 8)];
    clearConfirmPass.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft ;
    [clearConfirmPass addTarget:self action:@selector(clearConfirmPass) forControlEvents:UIControlEventTouchUpInside];
    self.textConfirmPass.rightView = clearConfirmPass ;
    self.textConfirmPass.rightViewMode = UITextFieldViewModeWhileEditing ;
    
    [self.btnRegister setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnRegister.titleLabel setFont:[UIFont systemFontOfSize:15]];
    
    [self.btnRegister addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 按钮事件

-(void)clearUsername
{
    self.textUsername.text = @"" ;
}
-(void)clearPassowrd
{
    self.textPassword.text = @"" ;
}
-(void)clearConfirmPass
{
    self.textConfirmPass.text = @"" ;
}

-(void)registerClick
{
    NSLog(@"registerClick");
    
    [self.textUsername resignFirstResponder];
    [self.textPassword resignFirstResponder];
    [self.textConfirmPass resignFirstResponder];
    
    NSLog(@"loginClick");
    
    //去掉两端空格
    NSString *username = [self.textUsername.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *password = [self.textPassword.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *confirmPass = [self.textConfirmPass.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    //NSLog(@"username=%@",username);
    //NSLog(@"password=%@",password);
    
    if([username isEqualToString:@""]){
        [self alert:@"请输入账号"];
        return ;
    }
    if([password isEqualToString:@""]){
        [self alert:@"请输入密码"];
        return ;
    }
    if([confirmPass isEqualToString:@""]){
        [self alert:@"请输入确认密码"];
        return ;
    }
    if([confirmPass isEqualToString:password]==FALSE){
        [self alert:@"两次输入的密码不一致"];
        return ;
    }
        
    //网络请求完成后执行的回调(其实同步请求不需要回调)
    void (^completion)(BOOL,NSString *message) = ^(BOOL isSuccess,NSString *message){
        
        if(isSuccess){
            
            [self alert:@"注册成功!"];
            
            //退回登录页面
            [self.navigationController popViewControllerAnimated:TRUE];
            
        }
        else{
            
            [self alert:message];
        }
    };
    
    [HttpRequestUtil registerWithUsername:username password:password completion:completion];
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    //NSLog(@"1111=111%@111",self.textUsername.text);
    //NSLog(@"2222=222%@222",self.textPassword.text);
    
    if(textField == self.textUsername){
        [self.textPassword becomeFirstResponder];
    }
    if(textField == self.textPassword){
        [self.textConfirmPass becomeFirstResponder];
    }
    if(textField == self.textConfirmPass){
        [self registerClick];
    }
    
    return TRUE ;
}

#pragma mark - others

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
