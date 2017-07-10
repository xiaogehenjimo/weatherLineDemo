//
//  UIColor+KDS_HexToUIColor.h
//  KDS_Phone
//
//  Created by KDS on 15-2-2.
//  Copyright (c) 2015年 kds. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  十六进制颜色值转换成UIColor类型
 */
@interface UIColor (KDS_HexToUIColor)

/**
 *  将十六进制数 转化为 UIColor
 *
 *  @param color 十六进制数
 *
 *  @return UIColor
 */
+ (UIColor *)kds_colorWithHexString:(NSString *)hexString;

/**
 *  将十六进制数 转化为 UIColor
 *
 *  @param color 十六进制数
 *  @param alpha 透明度
 *
 *  @return UIColor
 */
+ (UIColor*)kds_colorWithHexString:(NSString*)hexString andAlpha:(float)alpha;

/**
 *  获取颜色
 *
 *  @param red   红
 *  @param green 绿
 *  @param blue  蓝
 *
 *  @return 颜色
 */
+ (UIColor *)kds_colorWithRed:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat)blue;

@end
