//
//  LSCLoginViewController.m
//  QQZoneDemo
//
//  Created by 兜麦 on 15/6/26.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCLoginViewController.h"
#import "UIImage+Stretch.h"
#import "LSCMainViewController.h"
@interface LSCLoginViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)login;
@property (weak, nonatomic) IBOutlet UITextField *accounFiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;
- (IBAction)checkBoxClick:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *rememberPassword;
@property (weak, nonatomic) IBOutlet UIButton *autoLogin;

@end

@implementation LSCLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.loginButton setBackgroundImage:[UIImage changeImageSize:@"login_button_normal"] forState:UIControlStateNormal];
    
    [self.loginButton setBackgroundImage:[UIImage changeImageSize:@"login_button_pressed"] forState:UIControlStateHighlighted];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)login
{
    NSString *accoun = self.accounFiled.text;
    if (accoun.length == 0)
    {
        [self showError:@"请输入帐号"];
        return;
    }
    
    NSString *password = self.passwordField.text;
    if (password.length == 0)
    {
        [self showError:@"请输入密码"];
        return;
    }
    
    self.view.userInteractionEnabled = YES;
    [self.loadingView startAnimating];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.view.userInteractionEnabled = NO;
        [self.loadingView stopAnimating];
        
        if (![accoun isEqualToString:@"123"])
        {
            [self showError:@"请输入正确的帐号"];
            return ;
        }
        
        if (![password isEqualToString:@"123"])
        {
            [self showError:@"请输入正确的密码"];
            return ;
        }
        
        self.view.window.rootViewController = [[LSCMainViewController alloc] init];
    });
    
    
}
- (void)showError:(NSString *)errorMes
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"登录错误" message:errorMes delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    
    CAKeyframeAnimation *animagtion = [CAKeyframeAnimation animation];
    animagtion.keyPath = @"transform.translation.x";
    CGFloat value = 10;
    animagtion.values = @[@0,@(value),@(value),@0];
    animagtion.duration = 0.1;
    animagtion.repeatCount = 3;
    [self.loginView.layer addAnimation:animagtion forKey:nil];
    
}

- (IBAction)checkBoxClick:(UIButton *)sender
{
    sender.selected = ! sender.isSelected;
    if (sender == self.rememberPassword && !sender.isSelected)
    {
        self.autoLogin.selected = NO;
    }else
    {
        if (sender == self.autoLogin && sender.isSelected)
        {
            self.rememberPassword.selected = YES;
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.accounFiled)
    {
        [self.passwordField becomeFirstResponder];
    }else
    {
        [self login];
    }
    return YES;
}


@end
