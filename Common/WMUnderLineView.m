//
//  WMUnderLineView.m
//  WeiMi
//
//  Created by Sin on 2018/4/12.
//  Copyright © 2018年 Sin. All rights reserved.
//

#import "WMUnderLineView.h"
#import "WMCommonDefine.h"
#import "WMUIUtility.h"

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
    CGFloat imageViewX = 37;
    CGFloat imageViewY = 3;
    CGFloat imageViewW = 12;
    CGFloat imageViewH = 18;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH)];
    [self addSubview:self.imageView];
    
//    CGFloat rightW = type == WMUnderLineViewTypeNormal ? 0 : 80;
    
    CGFloat textFieldX = CGRectGetMaxX(self.imageView.frame) + 15;
    CGFloat textFieldW = Screen_Width - textFieldX - 30;
    CGFloat textFieldY = 3;
    CGFloat textFieldH = 15;
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(textFieldX, textFieldY, textFieldW, textFieldH)];
    
    [self addSubview:self.textField];
    
    if (type == WMUnderLineViewTypeWithRightImage) {
        CGFloat rightImageViewX = textFieldX + textFieldW - 20;
        CGFloat rightImageViewW = 16;
        CGFloat rightImageViewY = 4;
        CGFloat rightImageViewH = 11;
        self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(rightImageViewX, rightImageViewY, rightImageViewW, rightImageViewH)];
        [self addSubview:self.rightImageView];
    }
    
//    CGFloat rightX = CGRectGetMaxX(self.textField.frame)+5;
//    CGFloat rightY = imageViewY;
//    CGFloat rightH =44;
//    if(type != WMUnderLineViewTypeNormal) {
//        self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(rightX, rightY, rightW-5, rightH)];
//        self.rightButton.backgroundColor = [UIColor redColor];
//        [self addSubview:self.rightButton];
//    }
    
    CGFloat w = 300;
    CGFloat x = imageViewX;
    CGFloat y = 29;
    CGFloat h = 1;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    line.backgroundColor = [WMUIUtility color:@"0xcdcdcd"];
    [self addSubview:line];
}

@end
