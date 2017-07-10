//
//  SubDayView.m
//  LineDemo
//
//  Created by xuqinqiang on 2017/7/7.
//  Copyright © 2017年 CamelotChina.com. All rights reserved.
//

#import "SubDayView.h"
#import "XQQWeatherModel.h"
#import "CAShapeLayer+XQQExtension.h"

#define board 5

@interface SubDayView ()
/** 日期label */
@property (nonatomic, strong)  UILabel  *  dayLabel;
/** 时间 */
@property (nonatomic, strong)  UILabel  *  dateLabel;
/** 天气label */
@property (nonatomic, strong)  UILabel  *  weatherLabel;
/** 天气图片 */
@property (nonatomic, strong)  UILabel  *  weatherImageView;
/** 底部天气图片 */
@property (nonatomic, strong)  UILabel  *  bottomImageView;
/** 底部天气图片 */
@property (nonatomic, strong)  UILabel  *  bottomWeatherLabel;
/** 底部风力label */
@property (nonatomic, strong)  UILabel  *  windLabel;
/** 底部风向label */
@property (nonatomic, strong)  UILabel  *  windDirectionLabel;


/** 最高温度 */
@property (nonatomic, assign)  CGFloat   max;
/** 最低温度 */
@property (nonatomic, assign)  CGFloat   min;


@end


@implementation SubDayView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        
        self.layer.borderWidth = .5;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        
        _dayLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, board, self.width, 20)];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        _dayLabel.font = [UIFont systemFontOfSize:15];
        _dayLabel.text = @"今天";
        
        _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _dayLabel.bottom, self.width, 20)];
        _dateLabel.font = [UIFont systemFontOfSize:13];
        _dateLabel.textAlignment = NSTextAlignmentCenter;
        _dateLabel.text = @"7/23";
        
        _weatherLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _dateLabel.bottom, self.width, 20)];
        
        _weatherLabel.textAlignment = NSTextAlignmentCenter;
        _weatherLabel.font = [UIFont systemFontOfSize:14];
        _weatherLabel.text = @"多云";
        
        
        
        
        _weatherImageView = [[UILabel alloc]initWithFrame:CGRectMake(0, _weatherLabel.bottom, self.width, 20)];
        _weatherImageView.textAlignment = NSTextAlignmentCenter;
        _weatherImageView.text = @"⛅️";
//        _weatherImageView.backgroundColor = [UIColor redColor];
        
        
        //底部
        _windDirectionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.bottom - board - _dateLabel.height, self.width, _dayLabel.height)];
        _windDirectionLabel.font = [UIFont systemFontOfSize:14];
        _windDirectionLabel.textAlignment = NSTextAlignmentCenter;
        _windDirectionLabel.text = @"东风";
        
        
        
        _windLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _windDirectionLabel.y - _dayLabel.height, self.width, _dayLabel.height)];
        _windLabel.font = [UIFont systemFontOfSize:12];
        _windLabel.textAlignment = NSTextAlignmentCenter;
        _windLabel.text = @"8级";
        
        _bottomWeatherLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _windLabel.y - _dayLabel.height, self.width, _dayLabel.height)];
        
        _bottomWeatherLabel.textAlignment = NSTextAlignmentCenter;
        _bottomWeatherLabel.font = [UIFont systemFontOfSize:14];
        _bottomWeatherLabel.text = @"多云";
        
        _bottomImageView = [[UILabel alloc]initWithFrame:CGRectMake(_weatherImageView.x, _bottomWeatherLabel.y - _weatherImageView.height, _weatherImageView.width, _weatherImageView.height)];
        _bottomImageView.textAlignment = NSTextAlignmentCenter;
        _bottomImageView.text = @"⛅️";
        
        [self addSubview:_dayLabel];
        [self addSubview:_dateLabel];
        [self addSubview:_weatherLabel];
        [self addSubview:_weatherImageView];
        [self addSubview:_windDirectionLabel];
        [self addSubview:_windLabel];
        [self addSubview:_bottomWeatherLabel];
        [self addSubview:_bottomImageView];
        
    }
    return self;
}

- (void)setModel:(XQQWeatherModel *)model{
    _model = model;
    
    //天气图片距离 最大 最小值 点的间距
    CGFloat boardss = 10;
    
    //思路 固定最小值 在离底部图片往上 boardss 间距的位置
    //最大值在顶部图片底部往下 boardss  的位置
    //剩下的距离 以 1 长度  为单位 等分
    
    
    //最大值减最小值
    CGFloat differenceValue = [model.max floatValue] - [model.min floatValue];
    
    //间距
    CGFloat space = (_bottomImageView.y - boardss) - (_weatherImageView.bottom + boardss);
    
    
    //每一段间距
    CGFloat accumulated = space / differenceValue;
    
    //画最大值点
    CGFloat maxPointY = _bottomImageView.y - boardss - (([model.currentMax floatValue] - [model.min floatValue]) * accumulated);
    
    model.maxPoint = CGPointMake(_bottomImageView.centerX, maxPointY);
    
    [self.layer addSublayer:[CAShapeLayer CricleLayerWithPoint:CGPointMake(_bottomImageView.centerX, maxPointY) Board:6 FillColor:[UIColor redColor]]];
    
    //画最小值
    CGFloat minPointY = _bottomImageView.y - boardss - (([model.currentMin floatValue] - [model.min floatValue]) * accumulated);
    
    model.minPoint = CGPointMake(_bottomImageView.centerX, minPointY);
    
    [self.layer addSublayer:[CAShapeLayer CricleLayerWithPoint:CGPointMake(_bottomImageView.centerX, minPointY) Board:6 FillColor:[UIColor redColor]]];
    
    
    
    //赋值
    _dateLabel.text = model.dateStr;
    
    _dayLabel.text = model.weekStr;
    
    _bottomImageView.text = model.weatherStr;
    
    _weatherImageView.text = model.weatherStr;
    
    NSString * weatherStr = @"";
    
    if ([model.weatherStr isEqualToString:@"⛅️"]) {
        weatherStr = @"多云";
    } else if ([model.weatherStr isEqualToString:@"🌧"]) {
        weatherStr = @"小雨";
    }else{
        weatherStr = @"小雪";
    }
    
    _weatherLabel.text = weatherStr;
    
    _bottomWeatherLabel.text = weatherStr;
    
    
}



@end
