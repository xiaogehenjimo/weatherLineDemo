//
//  CAShapeLayer+XQQExtension.m
//  LineDemo
//
//  Created by xuqinqiang on 2017/7/10.
//  Copyright © 2017年 CamelotChina.com. All rights reserved.
//

#import "CAShapeLayer+XQQExtension.h"

@implementation CAShapeLayer (XQQExtension)

/**
 创建线条
 
 @param color 颜色
 @param lineWidth 线宽
 @param path path
 @return 线
 */
+ (CAShapeLayer*)getLineLayerWithColor:(UIColor*)color
                             LineWidth:(CGFloat)lineWidth
                                  Path:(UIBezierPath*)path{
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    
    layer.strokeColor = color.CGColor;
    
    layer.fillColor = [UIColor clearColor].CGColor;
    
    layer.lineWidth = lineWidth;
    
    layer.path = path.CGPath;
    
    return layer;
}



/**
 画圆
 
 @param point 中心点
 @param boards 直径
 @param color 颜色
 @return 圆
 */
+ (CAShapeLayer*)CricleLayerWithPoint:(CGPoint)point
                                Board:(CGFloat)boards
                            FillColor:(UIColor*)color{
    
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, boards, boards)];
    
    CAShapeLayer * layer = [[CAShapeLayer alloc]init];
    
    layer.frame = CGRectMake(0, 0, boards, boards);
    
    layer.position = point;
    
    layer.path = path.CGPath;
    
    layer.fillColor = [UIColor redColor].CGColor;
    
    return layer;
}



@end
