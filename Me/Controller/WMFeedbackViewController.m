//
//  WMFeedbackViewController.m
//  WeiMi
//
//  Created by Sin on 2018/4/23.
//  Copyright © 2018年 Sin. All rights reserved.
//

#import "WMFeedbackViewController.h"
#import "WMCommonDefine.h"

@interface WMFeedbackViewController ()<UITextViewDelegate>
@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) UILabel *placeholderLabel;
@end

@implementation WMFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
    self.title = @"意见反馈";
    [self addSubViews];
}

- (void)addSubViews {
    //反馈问题 view
    UIView *feedBackView = [[UIView alloc] initWithFrame:CGRectMake(0,Navi_Height, Screen_Width, 50)];
    UILabel *feedBackLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 90, 50)];
    feedBackLabel.text = @"反馈问题";
    feedBackLabel.textAlignment = NSTextAlignmentCenter;
    [feedBackView addSubview:feedBackLabel];
    
    
    UIButton *feedBackBtn = [[UIButton alloc] initWithFrame:CGRectMake(90, 0, Screen_Width-90-30, 50)];
    [feedBackBtn setTitle:@"请选择问题" forState:UIControlStateNormal];
    [feedBackBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [feedBackBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -200, 0, 0)];
    [feedBackView addSubview:feedBackBtn];
    
    UIImageView *arrowIV = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(feedBackBtn.frame), 22.5, 15, 15)];
    arrowIV.backgroundColor = [UIColor redColor];
    [feedBackView addSubview:arrowIV];

    [self.view addSubview:feedBackView];
    
    //textview
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(feedBackView.frame) + 8, Screen_Width, 175)];
    textView.delegate = self;
    self.textView = textView;
    self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 45)];
    [textView addSubview:self.placeholderLabel];
    self.placeholderLabel.numberOfLines = 2;
    self.placeholderLabel.text = @"感谢您对我们的关注与支持，您的宝贵意见我们将尽快改进，谢谢.";
    [self.view addSubview:textView];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.placeholderLabel.hidden = YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    self.placeholderLabel.hidden = textView.text.length != 0;
}

- (void)textViewDidChange:(UITextView *)textView {
    self.placeholderLabel.hidden = YES;
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
