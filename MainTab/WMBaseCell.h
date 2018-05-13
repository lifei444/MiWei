//
//  WMBaseCell.h
//  WeiMi
//
//  Created by Sin on 2018/4/10.
//  Copyright © 2018年 Sin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMBaseCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (void)loadSubViews;
- (void)setDataModel:(id)model;
+ (CGFloat)cellHegit;
@end