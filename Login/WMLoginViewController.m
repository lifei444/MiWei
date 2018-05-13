//
//  WMLoginViewController.m
//  WeiMi
//
//  Created by Sin on 2018/4/10.
//  Copyright © 2018年 Sin. All rights reserved.
//

#import "WMLoginViewController.h"
#import "WMCommonDefine.h"
#import "WMRegisterViewController.h"
#import "WMForgetPassViewController.h"
#import "WMUnderLineView.h"
#import "WMMainTabbarViewController.h"
#import "AppDelegate.h"
#import "WMUIUtility.h"

#define TitleViewHeight 64
#define GapBetweenTitleAndLogo 38
#define LogoImageHeight 62
#define GapBetweenLogoAndPhone 100
#define PhoneViewHeight 30
#define PasswordViewHeight 30
#define GapBetweenPasswordAndLoginButton 49
#define LoginButtonHeight 44
#define GapBetweenLoginButtonAndRegister 22
#define RegisterButtonHeight 13
#define GapBetweenRegisterAndForget 140
#define ForgetButtonHeight 15
#define GapBelowForget 30

#define LogoImageY TitleViewHeight + GapBetweenTitleAndLogo
#define PhoneViewY LogoImageY + LogoImageHeight + GapBetweenLogoAndPhone
#define PasswordViewY PhoneViewY + PhoneViewHeight + 30

#define LogoImageWidth 151
#define LogoImageX (Screen_Width - LogoImageWidth)/2

@interface WMLoginViewController ()
@property (nonatomic,strong) UILabel *titleLable;
@property (nonatomic,strong) UIImageView *logoImageView;
@property (nonatomic,strong) WMUnderLineView *phoneView;
@property (nonatomic,strong) WMUnderLineView *passwordView;
@property (nonatomic,strong) UIButton *weChatButton;
@property (nonatomic,strong) UIButton *loginButton;
@property (nonatomic,strong) UIButton *registerButton;
@property (nonatomic,strong) UIButton *forgetButton;
@end

@implementation WMLoginViewController

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleLable];
    [self.view addSubview:self.logoImageView];
    [self.view addSubview:self.phoneView];
    [self.view addSubview:self.passwordView];
    [self addsubViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = nil;
}

#pragma mark - Target action
- (void)weChat {
    NSLog(@"%s",__func__);
}

- (void)doLogin {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    WMMainTabbarViewController *tabVC = [[WMMainTabbarViewController alloc] init];
    app.window.rootViewController = tabVC;
}

- (void)doRegister{
    WMRegisterViewController *vc = [[WMRegisterViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)doForgetPass {
    WMForgetPassViewController *vc = [[WMForgetPassViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Inner methods
- (void)addsubViews {
    
    
    
    
    CGFloat weChatButtonW = 80;
    CGFloat weChatButtonX = CGRectGetMaxX(self.passwordView.frame)-weChatButtonW-35;
    CGFloat weChatButtonY = CGRectGetMaxY(self.passwordView.frame)+8;
    CGFloat weChatButtonH = 35;
    self.weChatButton = [[UIButton alloc] initWithFrame:CGRectMake(weChatButtonX, weChatButtonY, weChatButtonW, weChatButtonH)];
    [self.weChatButton setTitle:@"微信登录" forState:UIControlStateNormal];
    self.weChatButton.imageView.image = [UIImage imageNamed:@"login_wechat"];
    [self.weChatButton addTarget:self action:@selector(weChat) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.weChatButton];
    
    CGFloat loginButtonW = Screen_Width - 30*2;
    CGFloat loginButtonX = 30;
    CGFloat loginButtonY = CGRectGetMaxY(self.weChatButton.frame)+8;
    CGFloat loginButtonH = 44;
    self.loginButton = [[UIButton alloc] initWithFrame:CGRectMake(loginButtonX, loginButtonY, loginButtonW, loginButtonH)];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    self.loginButton.backgroundColor = [UIColor greenColor];
    [self.loginButton addTarget:self action:@selector(doLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
    
    CGFloat registerButtonW = Screen_Width - 30*2;
    CGFloat registerButtonX = 30;
    CGFloat registerButtonY = CGRectGetMaxY(self.loginButton.frame)+8;
    CGFloat registerButtonH = 44;
    self.registerButton = [[UIButton alloc] initWithFrame:CGRectMake(registerButtonX, registerButtonY, registerButtonW, registerButtonH)];
    [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
    self.registerButton.backgroundColor = [UIColor greenColor];
    [self.registerButton addTarget:self action:@selector(doRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.registerButton];
    
    
    CGFloat forgetButtonW = Screen_Width - 30*2;
    CGFloat forgetButtonX = 30;
    CGFloat forgetButtonH = 44;
    CGFloat forgetButtonY = Screen_Height - Bottom_height - forgetButtonH - 20;
    self.forgetButton = [[UIButton alloc] initWithFrame:CGRectMake(forgetButtonX, forgetButtonY, forgetButtonW, forgetButtonH)];
    [self.forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    self.forgetButton.backgroundColor = [UIColor greenColor];
    [self.forgetButton addTarget:self action:@selector(doForgetPass) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.forgetButton];
}

#pragma mark - Getters and setters
- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, Screen_Width, 17)];
        _titleLable.text = @"登录";
        _titleLable.textColor = [WMUIUtility color:@"0x444444"];
        _titleLable.font = [UIFont systemFontOfSize:17];
        _titleLable.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLable;
}

- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(LogoImageX, LogoImageY, LogoImageWidth, LogoImageHeight)];
        _logoImageView.image = [UIImage imageNamed:@"login_logo"];
    }
    return _logoImageView;
}

- (WMUnderLineView *)phoneView {
    if (!_phoneView) {
        _phoneView = [[WMUnderLineView alloc] initWithFrame:CGRectMake(0, PhoneViewY, Screen_Width, PhoneViewHeight) withType:WMUnderLineViewTypeNormal];
        _phoneView.imageView.image = [UIImage imageNamed:@"login_phone"];
//        _phoneView.rightImageView.image = [UIImage imageNamed:@"login_cancel"];
        _phoneView.textField.placeholder = @"输入手机号";
        _phoneView.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _phoneView.textField.adjustsFontSizeToFitWidth = YES;
    }
    return _phoneView;
}

- (WMUnderLineView *)passwordView {
    if (!_passwordView) {
        _passwordView = [[WMUnderLineView alloc] initWithFrame:CGRectMake(0, PasswordViewY, Screen_Width, PasswordViewHeight) withType:WMUnderLineViewTypeNormal];
        _passwordView.imageView.image = [UIImage imageNamed:@"login_password"];
//        _passwordView.rightImageView.image = [UIImage imageNamed:@"login_eye"];
        _passwordView.textField.placeholder = @"输入密码";
        _passwordView.textField.leftViewMode = UITextFieldViewModeAlways;
        _passwordView.textField.secureTextEntry = YES;
        _passwordView.textField.clearButtonMode = UITextFieldViewModeNever;
        _passwordView.textField.adjustsFontSizeToFitWidth = YES;
    }
    return _passwordView;
}

@end
