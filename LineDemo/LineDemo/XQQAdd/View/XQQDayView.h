//
//  XQQDayView.h
//  LineDemo
//
//  Created by xuqinqiang on 2017/7/10.
//  Copyright © 2017年 CamelotChina.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XQQWeatherModel;

@interface XQQDayView : UIView

/** 数据 */
@property (nonatomic, strong)  NSArray<XQQWeatherModel*>  *dataArr;


@end
