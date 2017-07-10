//
//  CAShapeLayer+XQQExtension.h
//  LineDemo
//
//  Created by xuqinqiang on 2017/7/10.
//  Copyright © 2017年 CamelotChina.com. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAShapeLayer (XQQExtension)

/**
 创建线条
 
 @param color 颜色
 @param lineWidth 线宽
 @param path path
 @return 线
 */
+ (CAShapeLayer*)getLineLayerWithColor:(UIColor*)color
                             LineWidth:(CGFloat)lineWidth
                                  Path:(UIBezierPath*)path;


/**
 画圆
 
 @param point 中心点
 @param boards 直径
 @param color 颜色
 @return 圆
 */
+ (CAShapeLayer*)CricleLayerWithPoint:(CGPoint)point
                                Board:(CGFloat)boards
                            FillColor:(UIColor*)color;



@end
