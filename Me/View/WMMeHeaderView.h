//
//  WMMeHeaderView.h
//  WeiMi
//
//  Created by Sin on 2018/4/10.
//  Copyright © 2018年 Sin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMMeHeaderView : UIView
+ (instancetype)headerView;

@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel *idLabel;
@property (nonatomic,strong) UILabel *addressLabel;

+ (CGFloat)height;
@end
