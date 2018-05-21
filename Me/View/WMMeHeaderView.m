//
//  WMMeHeaderView.m
//  WeiMi
//
//  Created by Sin on 2018/4/10.
//  Copyright © 2018年 Sin. All rights reserved.
//

#import "WMMeHeaderView.h"
#import "WMCommonDefine.h"

#define kheight 300

@interface WMMeHeaderView()
@end

@implementation WMMeHeaderView
+ (instancetype)headerView {
    WMMeHeaderView *v = [[self alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, kheight)];
    return v;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self loadSubViews];
    }
    return self;
}

- (void)loadSubViews {
    self.backgroundColor = [UIColor colorWithRed:34/255.0 green:154/255.0 blue:150/255.0 alpha:1];
    self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake((Screen_Width-100)/2, 40, 100, 100)];
    self.iconImageView.layer.cornerRadius = 50;
    self.iconImageView.layer.masksToBounds = YES;
    self.idLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, Screen_Width, 44)];
    self.idLabel.textAlignment = NSTextAlignmentCenter;
    self.addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 220, Screen_Width, 44)];
    self.addressLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.idLabel];
    [self addSubview:self.addressLabel];
}

+ (CGFloat)height {
    return kheight;
}

@end
