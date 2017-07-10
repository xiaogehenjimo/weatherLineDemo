//
//  XQQWeatherModel.h
//  LineDemo
//
//  Created by xuqinqiang on 2017/7/7.
//  Copyright © 2017年 CamelotChina.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XQQWeatherModel : NSObject


/** 日期 */
@property (nonatomic, copy)    NSString  *  dateStr;
/** 星期 */
@property (nonatomic, copy)    NSString  *  weekStr;
/** 风力 */
@property (nonatomic, copy)    NSString  *  windPower;
/** 风向 */
@property (nonatomic, copy)    NSString  *  windDirection;
/** 天气 */
@property (nonatomic, copy)    NSString  *  weatherStr;







/** 最近12天 天气最大值 */
@property (nonatomic, copy)    NSString  *  max;
/** 最近12天 天气最小值 */
@property (nonatomic, copy)    NSString  *  min;
/** 当前天的最大值 */
@property (nonatomic, copy)    NSString  *  currentMax;
/** 当前天的最小值 */
@property (nonatomic, copy)    NSString  *  currentMin;
/** 序号 */
@property (nonatomic, assign)  NSInteger   index;


/** 计算后的当日最小值点 */
@property (nonatomic, assign)  CGPoint   minPoint;
/** 计算后的当日最大点 */
@property (nonatomic, assign)  CGPoint   maxPoint;



@end
