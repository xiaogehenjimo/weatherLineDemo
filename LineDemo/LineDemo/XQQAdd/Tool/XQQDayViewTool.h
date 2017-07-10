//
//  XQQDayViewTool.h
//  LineDemo
//
//  Created by xuqinqiang on 2017/7/10.
//  Copyright © 2017年 CamelotChina.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XQQWeatherModel.h"

@interface XQQDayViewTool : NSObject

/**
 根据两个点获得两个点获得两个点之间的中心点
 
 @param firstPoint 第一个点
 @param secondPoint 第二个点
 @return 中心点
 */
+ (CGPoint)getMidePointWithFirstPoint:(CGPoint)firstPoint
                          SecondPoint:(CGPoint)secondPoint;


/**
 获得中心点
 
 @param firstModel 第一个点的model
 @param secondModel 第二个点的model
 @param isMax       是否是最大值
 @return 中心点
 */
+ (CGPoint)getMindPointWithSubViewWidth:(CGFloat)subViewWidth
                             FirstModel:(XQQWeatherModel*)firstModel
                            SecondModel:(XQQWeatherModel*)secondModel
                                  isMax:(BOOL)isMax;

/**
 获得控制点
 
 @param firstPoint 左边点
 @param secondPoint 右边点
 @return 控制点
 */
+ (CGPoint)getControlPointWithFirstPoint:(CGPoint)firstPoint
                             SecondPoint:(CGPoint)secondPoint;

@end
