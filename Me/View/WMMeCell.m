//
//  WMMeCell.m
//  WeiMi
//
//  Created by Sin on 2018/4/10.
//  Copyright © 2018年 Sin. All rights reserved.
//

#import "WMMeCell.h"

@interface WMMeCell ()
@end

@implementation WMMeCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    return [super cellWithTableView:tableView];
}

- (void)loadSubViews {
    self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(4, 4, 42, 42)];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(58, 4, 100, 42)];
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.label];
}

+ (CGFloat)cellHegit {
    return 50;
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
