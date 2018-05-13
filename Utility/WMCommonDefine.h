//
//  WMCommonDefine.h
//  WeiMi
//
//  Created by Sin on 2018/4/10.
//  Copyright © 2018年 Sin. All rights reserved.
//

#ifndef WMCommonDefine_h
#define WMCommonDefine_h

#define Screen_Bounds [UIScreen mainScreen].bounds
#define Screen_Size [UIScreen mainScreen].bounds.size
#define Screen_Height [UIScreen mainScreen].bounds.size.height
#define Screen_Width [UIScreen mainScreen].bounds.size.width

#define Navi_Height [UIApplication sharedApplication].statusBarFrame.size.height + 44
#define Bottom_height (Navi_Height>64?34.0:0.0)

#endif /* WMCommonDefine_h */
