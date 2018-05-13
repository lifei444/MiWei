//
//  WMRegisterViewController.m
//  WeiMi
//
//  Created by Sin on 2018/4/10.
//  Copyright © 2018年 Sin. All rights reserved.
//

#import "WMRegisterViewController.h"
#import "WMUnderLineView.h"
#import "WMCommonDefine.h"

#define WaitSeconds 3
@interface WMRegisterViewController ()
@property (nonatomic,strong) WMUnderLineView *phoneView;
@property (nonatomic,strong) WMUnderLineView *verfyView;
@property (nonatomic,strong) WMUnderLineView *passView;
@property (nonatomic,strong) WMUnderLineView *confimView;
@property (nonatomic,strong) UIButton *registerButton;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) int count;
@end

@implementation WMRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"注册";
    self.count = WaitSeconds;
    
    [self loadSubViews];
}

- (void)registerAction {
    
}

- (void)countDown {
    if(self.count > 0) {
        self.count --;
        [self.phoneView.rightButton setTitle:[NSString stringWithFormat:@"重新发送(%d)",self.count] forState:UIControlStateNormal];
    }else {
        if([self.timer isValid]) {
            [self.timer invalidate];
            self.timer = nil;
        }
        [self.phoneView.rightButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.count = WaitSeconds;
    }
}

- (void)startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
}

- (void)loadSubViews {
    CGFloat phoneX = 0;
    CGFloat phoneY = 30 + Navi_Height;
    CGFloat phoneW = Screen_Width;
    CGFloat phoneH = 50;
    self.phoneView = [[WMUnderLineView alloc] initWithFrame:CGRectMake(phoneX, phoneY, phoneW, phoneH) withType:WMUnderLineViewTypeWithRightButton];
    self.phoneView.textField.placeholder = @"输入手机号";
    [self.phoneView.rightButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.phoneView.rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.phoneView.rightButton addTarget:self action:@selector(startTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.phoneView];
    
    CGFloat verfyX = 0;
    CGFloat verfyY = CGRectGetMaxY(self.phoneView.frame) + 20;
    CGFloat verfyW = Screen_Width;
    CGFloat verfyH = 50;
    self.verfyView = [[WMUnderLineView alloc] initWithFrame:CGRectMake(verfyX, verfyY, verfyW, verfyH)];
    self.verfyView.textField.placeholder = @"输入验证码";
    [self.view addSubview:self.verfyView];
    
    CGFloat passX = 0;
    CGFloat passY = CGRectGetMaxY(self.verfyView.frame) + 20;
    CGFloat passW = Screen_Width;
    CGFloat passH = 50;
    self.passView = [[WMUnderLineView alloc] initWithFrame:CGRectMake(passX, passY, passW, passH)];
    self.passView.textField.placeholder = @"输入密码";
    [self.view addSubview:self.passView];
    
    CGFloat confimX = 0;
    CGFloat confimY = CGRectGetMaxY(self.passView.frame) + 20;
    CGFloat confimW = Screen_Width;
    CGFloat confimH = 50;
    self.confimView = [[WMUnderLineView alloc] initWithFrame:CGRectMake(confimX, confimY, confimW, confimH)];
    self.confimView.textField.placeholder = @"确认密码";
    [self.view addSubview:self.confimView];
    
    
    CGFloat registerX = 0;
    CGFloat registerY = CGRectGetMaxY(self.confimView.frame) + 20;
    CGFloat registerW = Screen_Width;
    CGFloat registerH = 50;
    self.registerButton = [[UIButton alloc] initWithFrame:CGRectMake(registerX, registerY, registerW, registerH)];
    self.registerButton.backgroundColor = [UIColor redColor];
    [self.registerButton addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.view addSubview:self.registerButton];
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
