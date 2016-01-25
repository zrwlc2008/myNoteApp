//
//  LoginViewController.m
//  张睿云笔记
//
//  Created by jerry on 16-1-7.
//  Copyright (c) 2016年 jerry. All rights reserved.
//

#import "LoginViewController.h"
#import "Constant.h"
#import "RegisterViewController.h"
#import "HttpRequestUtil.h"
#import "IndexTabBarViewController.h"
#import "UIViewController+Alert.h"

@interface LoginViewController () 

@end

@implementation LoginViewController

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
    
    self.textUsername.placeholder = @"请输入账户名称";
    self.textPassword.placeholder = @"请输入密码";
    
    //设为密码框
    self.textPassword.secureTextEntry = TRUE ;
    
    //圆角
    self.textUsername.borderStyle = UITextBorderStyleRoundedRect ;
    self.textPassword.borderStyle = UITextBorderStyleRoundedRect ;

    //键盘类型
    self.textUsername.keyboardType = UIKeyboardTypeDefault ;
    self.textPassword.keyboardType = UIKeyboardTypeDefault ;
    
    //return键类型
    self.textUsername.returnKeyType = UIReturnKeyNext ;
    self.textPassword.returnKeyType = UIReturnKeyDone ;
    
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
    
    
    [self.btnLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnLogin.titleLabel setFont:[UIFont systemFontOfSize:15]];
    
    [self.btnRegister setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnRegister.titleLabel setFont:[UIFont systemFontOfSize:15]];
    
    [self.btnLogin addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
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



-(void)loginClick
{
    [self.textUsername resignFirstResponder];
    [self.textPassword resignFirstResponder];
    
    //NSLog(@"loginClick");
    
    //去掉两端空格
    NSString *username = [self.textUsername.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *password = [self.textPassword.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
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
    
        
    //网络请求完成后执行的回调(其实同步请求不需要回调)
    void (^completion)(BOOL,NSString *message) = ^(BOOL isSuccess,NSString *message){
        
        if(isSuccess){
            
            //将用户名写入userDefaults，作为登录痕迹
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:self.textUsername.text forKey:CONST_USERNAME_KEY];
            [userDefaults synchronize];
            
            //进入主页(主页各子视图的实例化都在indexTabBarVC的viewDidLoad中)
            IndexTabBarViewController * indexTabBarVC = [[IndexTabBarViewController alloc] init];
            [self presentViewController:indexTabBarVC animated:TRUE completion:^{}];
        }
        else{
            [self alert:message];
        }
    };
    
    [HttpRequestUtil loginWithUsername:username password:password completion:completion];
    
    
}

-(void)registerClick
{
    NSLog(@"registerClick");
    
//    修改返回登录页的按钮标题
//    UIBarButtonItem * item = [[UIBarButtonItem alloc] init];
//    item.title = @"aaa";
//    self.navigationItem.backBarButtonItem = item ;
    
    RegisterViewController * regVC = [[RegisterViewController alloc] init];
    regVC.navigationItem.title = @"注册" ;
    
    [self.navigationController pushViewController:regVC animated:TRUE];
    
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
        [self loginClick];
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
