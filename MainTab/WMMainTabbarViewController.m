//
//  WMMainTabbarViewController.m
//  WeiMi
//
//  Created by Sin on 2018/4/10.
//  Copyright © 2018年 Sin. All rights reserved.
//

#import "WMMainTabbarViewController.h"
#import "WMNavigationViewController.h"
#import "WMDeviceViewController.h"
#import "WMMessageViewController.h"
#import "WMMeViewController.h"

@interface WMMainTabbarViewController ()

@end

@implementation WMMainTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setViewController];
}

- (void)setViewController {
    WMDeviceViewController *setVC = [[WMDeviceViewController alloc] init];
    WMNavigationViewController *setNav = [self getNaviBy:setVC tiltle:@"设备" image:nil selectImage:nil];
    
    WMMessageViewController *weaVC = [[WMMessageViewController alloc] init];
    WMNavigationViewController *weaNav = [self getNaviBy:weaVC tiltle:@"消息" image:nil selectImage:nil];
    
    WMMeViewController *meVC = [[WMMeViewController alloc] init];
    WMNavigationViewController *meNav = [self getNaviBy:meVC tiltle:@"个人" image:nil selectImage:nil];
    
    self.viewControllers = @[setNav,weaNav,meNav];
    
}

- (WMNavigationViewController *)getNaviBy:(UIViewController *)vc tiltle:(NSString *)title image:(UIImage *)image selectImage:(UIImage *)selectImage{
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectImage;
    WMNavigationViewController *nav = [[WMNavigationViewController alloc] initWithRootViewController:vc];
    return nav;
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
