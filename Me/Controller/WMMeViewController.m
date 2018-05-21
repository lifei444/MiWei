//
//  WMMeViewController.m
//  WeiMi
//
//  Created by Sin on 2018/4/10.
//  Copyright © 2018年 Sin. All rights reserved.
//

#import "WMMeViewController.h"
#import "WMMeCell.h"
#import "WMMeHeaderView.h"
#import "WMPersionViewController.h"
#import "WMMeAddressViewController.h"
#import "WMFeedbackViewController.h"

@interface WMMeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *titles;
@property (nonatomic,strong) NSArray *imageNames;
@end

@implementation WMMeViewController

#pragma mark - Life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"个人";
        self.navigationItem.title = @"个人设置";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.titles = @[@"修改密码",@"订单中心",@"报警管理",@"意见反馈"];
    
    [self setRightNavBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return 4;
    }else {
        return 1;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WMMeCell *cell = [WMMeCell cellWithTableView:tableView];
    cell.iconImageView.backgroundColor = [UIColor redColor];
    if(indexPath.section == 0) {
        cell.label.text = self.titles[indexPath.row];
    }else if(indexPath.section == 1) {
        cell.label.text = @"关于微米";
    }else {
        cell.label.text = @"退出";
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        if(indexPath.row == 0) {
            NSLog(@"修改密码");
        }else if(indexPath.row == 1) {
            NSLog(@"订单中心");
        }else if(indexPath.row == 2) {
            NSLog(@"报警管理");
        }else {
            WMFeedbackViewController *vc = [[WMFeedbackViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else if(indexPath.section == 1){
        NSLog(@"关于微米");
    }else {
        NSLog(@"退出");
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(section == 0) {
        return [WMMeHeaderView height];
    }else {
        return 8;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if(section == 0) {
        WMMeHeaderView *view = [WMMeHeaderView headerView];
        view.backgroundColor = [UIColor greenColor];
        view.iconImageView.backgroundColor = [UIColor redColor];
        view.idLabel.text = @"测试账号";
        view.addressLabel.text = @"地址";
        return view;
    }else {
        return [UIView new];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [WMMeCell cellHegit];
}

- (void)setRightNavBar {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(setting:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (void)setting:(UIButton *)btn {
    WMPersionViewController *vc = [[WMPersionViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableView *)tableView {
    if(!_tableView) {
        _tableView  = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

@end
