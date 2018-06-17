//
//  WMDeviceCell.m
//  WeiMi
//
//  Created by Sin on 2018/4/10.
//  Copyright © 2018年 Sin. All rights reserved.
//

#import "WMDeviceCell.h"
#import "WMCommonDefine.h"

@interface WMDeviceCell()
@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *typeLabel;
@property (nonatomic,strong) UILabel *modelLabel;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *rentLabel;
@property (nonatomic,strong) UILabel *resultLabel;
@end

@implementation WMDeviceCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    return [super cellWithTableView:tableView];
}

- (void)setDataModel:(id)model {
    self.iconImageView.backgroundColor = [UIColor redColor];
    self.nameLabel.text = @"小明的设备";
    self.typeLabel.text = @"净化器";
    self.modelLabel.text = @"M200";
    self.priceLabel.text = @"2元/3小时";
    self.rentLabel.text = @"租赁设备";
    self.resultLabel.text = @"以结束";
}

- (void)loadSubViews {
    CGFloat iconImageViewX = 35;
    CGFloat iconImageViewY = 20;
    CGFloat iconImageViewW = 40;
    CGFloat iconImageViewH = 100;
    self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(iconImageViewX, iconImageViewY, iconImageViewW, iconImageViewH)];
    [self.contentView addSubview:self.iconImageView];
    
    
    CGFloat nameLabelX = CGRectGetMaxX(self.iconImageView.frame) + 50;
    CGFloat nameLabelY = iconImageViewY;
    CGFloat nameLabelW = Screen_Width - nameLabelX;
    CGFloat nameLabelH = 20;
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH)];
    self.nameLabel.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:self.nameLabel];
    
    CGFloat typeLabelX = nameLabelX;
    CGFloat typeLabelY = CGRectGetMaxY(self.nameLabel.frame) + 8;
    CGFloat typeLabelW = 42;
    CGFloat typeLabelH = 15;
    self.typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(typeLabelX, typeLabelY, typeLabelW, typeLabelH)];
    self.typeLabel.font = [UIFont systemFontOfSize:12];
    self.typeLabel.backgroundColor = [UIColor colorWithRed:31/255.0 green:150/255.0 blue:233/255.0 alpha:1];
    self.typeLabel.textColor = [UIColor whiteColor];
    self.typeLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.typeLabel];
    
    CGFloat modelLabelX = CGRectGetMaxX(self.typeLabel.frame)+12;
    CGFloat modelLabelY = typeLabelY;
    CGFloat modelLabelW = typeLabelW;
    CGFloat modelLabelH = typeLabelH;
    self.modelLabel = [[UILabel alloc] initWithFrame:CGRectMake(modelLabelX, modelLabelY, modelLabelW, modelLabelH)];
    self.modelLabel.font = [UIFont systemFontOfSize:12];
    self.modelLabel.backgroundColor = [UIColor colorWithRed:31/255.0 green:150/255.0 blue:233/255.0 alpha:1];
    self.modelLabel.textColor = [UIColor whiteColor];
    self.modelLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.modelLabel];
    
    CGFloat priceLabelX = typeLabelX;
    CGFloat priceLabelY = CGRectGetMaxY(self.typeLabel.frame)+15;
    CGFloat priceLabelW = nameLabelW;
    CGFloat priceLabelH = 20;
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(priceLabelX, priceLabelY, priceLabelW, priceLabelH)];
    self.priceLabel.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:self.priceLabel];
    
    CGFloat rentLabelX = typeLabelX;
    CGFloat rentLabelY = CGRectGetMaxY(self.priceLabel.frame)+15;
    CGFloat rentLabelW = 150;
    CGFloat rentLabelH = 15;
    self.rentLabel = [[UILabel alloc] initWithFrame:CGRectMake(rentLabelX, rentLabelY, rentLabelW, rentLabelH)];
    self.rentLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.rentLabel];
    
    
    CGFloat resultLabelW = 60;
    CGFloat resultLabelX = Screen_Width - 15 -resultLabelW;
    CGFloat resultLabelY = rentLabelY;
    CGFloat resultLabelH = 15;
    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(resultLabelX, resultLabelY, resultLabelW, resultLabelH)];
    self.resultLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.resultLabel];
}

+ (CGFloat)cellHeight {
    return 132;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
