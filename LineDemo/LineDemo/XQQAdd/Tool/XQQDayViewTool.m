//
//  XQQDayViewTool.m
//  LineDemo
//
//  Created by xuqinqiang on 2017/7/10.
//  Copyright © 2017年 CamelotChina.com. All rights reserved.
//

#import "XQQDayViewTool.h"

@implementation XQQDayViewTool


/**
 根据两个点获得两个点获得两个点之间的中心点
 
 @param firstPoint 第一个点
 @param secondPoint 第二个点
 @return 中心点
 */
+ (CGPoint)getMidePointWithFirstPoint:(CGPoint)firstPoint
                          SecondPoint:(CGPoint)secondPoint{
    
    return CGPointMake((firstPoint.x + secondPoint.x) * .5, (firstPoint.y +secondPoint.y) *.5);
}


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
                                isMax:(BOOL)isMax{
    
    CGFloat width = subViewWidth;
    
    CGPoint minFirstPoint = firstModel.minPoint;
    
    CGPoint minSecondPoint = secondModel.minPoint;
    
    CGPoint maxFirstPoint = firstModel.maxPoint;
    
    CGPoint maxSecondPoint = secondModel.maxPoint;
    
    if (isMax) {
        return CGPointMake((maxFirstPoint.x + firstModel.index * width + maxSecondPoint.x+ secondModel.index * width) / 2, (maxFirstPoint.y + maxSecondPoint.y) / 2);
    }else{
        return CGPointMake((minFirstPoint.x + firstModel.index * width + minSecondPoint.x+ secondModel.index * width) / 2, (minFirstPoint.y + minSecondPoint.y) / 2);
    }
}

/**
 获得控制点
 
 @param firstPoint 左边点
 @param secondPoint 右边点
 @return 控制点
 */
+ (CGPoint)getControlPointWithFirstPoint:(CGPoint)firstPoint
                             SecondPoint:(CGPoint)secondPoint{
    
    CGPoint controlPoint = [self getMidePointWithFirstPoint:firstPoint
                                                SecondPoint:secondPoint];
    
    CGFloat diffY = fabs(secondPoint.y - controlPoint.y);
    
    if (firstPoint.y < secondPoint.y)
        
        controlPoint.y += diffY;
    
    else if (firstPoint.y > secondPoint.y)
        
        controlPoint.y -= diffY;
    
    return controlPoint;
}


@end
