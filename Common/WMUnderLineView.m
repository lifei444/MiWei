//
//  WMUnderLineView.m
//  WeiMi
//
//  Created by Sin on 2018/4/12.
//  Copyright © 2018年 Sin. All rights reserved.
//

#import "WMUnderLineView.h"
#import "WMCommonDefine.h"

@implementation WMUnderLineView

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame withType:WMUnderLineViewTypeNormal];
}

- (instancetype)initWithFrame:(CGRect)frame withType:(WMUnderLineViewType)type {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubviews:type];
    }
    return self;
}

- (void)addSubviews:(WMUnderLineViewType)type {
    CGFloat imageViewX = 35;
    CGFloat imageViewY = 3;
    CGFloat imageViewW = 24;
    CGFloat imageViewH = 44;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH)];
    self.imageView.backgroundColor = [UIColor redColor];
    [self addSubview:self.imageView];
    
    CGFloat rightW = type == WMUnderLineViewTypeNormal ? 0 : 80;
    
    CGFloat textFieldX = CGRectGetMaxX(self.imageView.frame) + 8;
    CGFloat textFieldW = Screen_Width - textFieldX - 35 -rightW;
    CGFloat textFieldY = 3;
    CGFloat textFieldH = 44;
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(textFieldX, textFieldY, textFieldW, textFieldH)];
    
    [self addSubview:self.textField];
    
    CGFloat rightX = CGRectGetMaxX(self.textField.frame)+5;
    CGFloat rightY = imageViewY;
    CGFloat rightH =44;
    if(type != WMUnderLineViewTypeNormal) {
        self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(rightX, rightY, rightW-5, rightH)];
        self.rightButton.backgroundColor = [UIColor redColor];
        [self addSubview:self.rightButton];
    }
    
    CGFloat w = Screen_Width - imageViewX*2;
    CGFloat x = imageViewX;
    CGFloat y = 49;
    CGFloat h = 1;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    line.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
    [self addSubview:line];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
