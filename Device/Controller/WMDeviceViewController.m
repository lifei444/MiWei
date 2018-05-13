//
//  WMDeviceViewController.m
//  WeiMi
//
//  Created by Sin on 2018/4/10.
//  Copyright © 2018年 Sin. All rights reserved.
//

#import "WMDeviceViewController.h"
#import "WMDeviceCell.h"
#import "WMPayRecordViewController.h"
#import "WMDeviceConfigViewController.h"
#import "WMScanViewController.h"
#import "WMDeviceInfoViewController.h"

@interface WMDeviceViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation WMDeviceViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title =@"设备";
        self.navigationItem.title = @"设备中心";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self setRightNavBar];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WMDeviceCell *cell = [WMDeviceCell cellWithTableView:tableView];
    [cell setDataModel:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [WMDeviceCell cellHegit];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WMDeviceInfoViewController *vc = [[WMDeviceInfoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)setRightNavBar {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(setting:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (void)setting:(UIButton *)btn {
    WMScanViewController *vc = [[WMScanViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableView *)tableView {
    if(!_tableView) {
        _tableView  = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
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
