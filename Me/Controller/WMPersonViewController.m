//
//  WMPersonViewController.m
//  WeiMi
//
//  Created by Sin on 2018/4/11.
//  Copyright © 2018年 Sin. All rights reserved.
//

#import "WMPersonViewController.h"
#import "WMMeAddressViewController.h"
#import "WMMeNameViewController.h"
#import "WMMeIconViewController.h"

@interface WMPersonViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation WMPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人资料";
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if(indexPath.row == 0) {
        cell.textLabel.text = @"头像";
        cell.imageView.image = nil;
    }else if(indexPath.row == 1) {
        cell.textLabel.text = @"昵称";
        cell.detailTextLabel.text= @"Megeid";
    }else {
        cell.textLabel.text = @"地址";
        cell.detailTextLabel.text= @"北京市海淀区";
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        return 80;
    }else {
        return 44;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        WMMeIconViewController *vc = [[WMMeIconViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 1){
        WMMeNameViewController *vc = [[WMMeNameViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        WMMeAddressViewController *vc = [[WMMeAddressViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UITableView *)tableView {
    if(!_tableView) {
        _tableView  = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
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
