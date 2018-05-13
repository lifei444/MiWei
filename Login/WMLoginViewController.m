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

@interface WMLoginViewController ()
@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) WMUnderLineView *phoneView;
@property (nonatomic,strong) WMUnderLineView *passView;
@property (nonatomic,strong) UIButton *weChatButton;
@property (nonatomic,strong) UIButton *loginButton;
@property (nonatomic,strong) UIButton *registerButton;
@property (nonatomic,strong) UIButton *fegetButton;
@end

@implementation WMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"登录";
    [self addsubViews];
}


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

- (void)addsubViews {
    
    CGFloat iconImageViewW = 150;
    CGFloat iconImageViewX = (Screen_Width -iconImageViewW)/2 ;
    CGFloat iconImageViewY = 120+30;
    CGFloat iconImageViewH = 70;
    self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(iconImageViewX, iconImageViewY, iconImageViewW, iconImageViewH)];
    self.iconImageView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.iconImageView];
    
    
    CGFloat phoneViewW = Screen_Width;
    CGFloat phoneViewX = 0 ;
    CGFloat phoneViewY = CGRectGetMaxY(self.iconImageView.frame)+30;
    CGFloat phoneViewH = 50;
    self.phoneView = [[WMUnderLineView alloc] initWithFrame:CGRectMake(phoneViewX, phoneViewY, phoneViewW, phoneViewH)];
    UIImageView *phone = [[UIImageView alloc] initWithFrame:CGRectMake(0, 8, 20, 28)];
    phone.backgroundColor = [UIColor redColor];
    self.phoneView.imageView.backgroundColor = [UIColor redColor];
    self.phoneView.textField.placeholder = @"请输入手机号";
    self.phoneView.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.phoneView.textField.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:self.phoneView];
    
    CGFloat passViewW = Screen_Width;
    CGFloat passViewX = 0 ;
    CGFloat passViewY = CGRectGetMaxY(self.phoneView.frame)+30;
    CGFloat passViewH = 50;
    self.passView = [[WMUnderLineView alloc] initWithFrame:CGRectMake(passViewX, passViewY, passViewW, passViewH)];
    self.passView.imageView.backgroundColor = [UIColor redColor];
    self.passView.textField.placeholder = @"请输入密码";
    self.passView.textField.leftViewMode = UITextFieldViewModeAlways;
    self.passView.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passView.textField.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:self.passView];
    
    CGFloat weChatButtonW = 80;
    CGFloat weChatButtonX = CGRectGetMaxX(self.passView.frame)-weChatButtonW-35;
    CGFloat weChatButtonY = CGRectGetMaxY(self.passView.frame)+8;
    CGFloat weChatButtonH = 35;
    self.weChatButton = [[UIButton alloc] initWithFrame:CGRectMake(weChatButtonX, weChatButtonY, weChatButtonW, weChatButtonH)];
    [self.weChatButton setTitle:@"微信登录" forState:UIControlStateNormal];
    self.weChatButton.backgroundColor = [UIColor greenColor];
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
    
    
    CGFloat fegetButtonW = Screen_Width - 30*2;
    CGFloat fegetButtonX = 30;
    CGFloat fegetButtonH = 44;
    CGFloat fegetButtonY = Screen_Height - Bottom_height - fegetButtonH - 20;
    self.fegetButton = [[UIButton alloc] initWithFrame:CGRectMake(fegetButtonX, fegetButtonY, fegetButtonW, fegetButtonH)];
    [self.fegetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    self.fegetButton.backgroundColor = [UIColor greenColor];
    [self.fegetButton addTarget:self action:@selector(doForgetPass) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.fegetButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
