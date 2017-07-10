//
//  MainViewController.m
//  LineDemo
//
//  Created by xuqinqiang on 2017/7/7.
//  Copyright © 2017年 CamelotChina.com. All rights reserved.
//

#import "MainViewController.h"
#import "XQQWeatherModel.h"

#import "XQQDayView.h"


@interface MainViewController ()


/** 天气View */
@property (nonatomic, strong)  XQQDayView  *  dayView;

/** 数据源 */
@property (nonatomic, strong)  NSMutableArray<XQQWeatherModel*>  *dataArr;

@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.dayView];
    
    [self initData];
    //设置数据
    self.dayView.dataArr = self.dataArr;
    
}

#pragma mark - get

- (XQQDayView *)dayView{
    if (!_dayView) {
        _dayView = [[XQQDayView alloc]initWithFrame:CGRectMake(0, 100, iPhoneWidth, 300)];
    }
    return _dayView;
}


- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = @[].mutableCopy;
    }
    return _dataArr;
}

- (void)initData{
    for (NSInteger i = 0; i < 12; i++) {
        @autoreleasepool {
            XQQWeatherModel * model = [[XQQWeatherModel alloc]init];
            
            model.max = @"30";
            model.min = @"16";
            
            
            model.dateStr = [NSString stringWithFormat:@"07/%ld",i];
            
            model.windPower = @"6级";
            
            model.windDirection = @"西北风";
            
            model.index = i;
            
            if (i == 0) {
                model.currentMin = @"16";
                model.currentMax = @"24";
                model.weekStr = @"昨天";
                model.weatherStr = @"⛅️";
            }else if (i == 1) {
                model.currentMin = @"18";
                model.currentMax = @"27";
                model.weekStr = @"今天";
                model.weatherStr = @"⛅️";
            }else if( i == 2){
                model.currentMin = @"17";
                model.currentMax = @"24";
                model.weekStr = @"明天";
                model.weatherStr = @"🌧";
            }else if (i == 3){
                model.currentMin = @"21";
                model.currentMax = @"26";
                model.weekStr = @"周四";
                model.weatherStr = @"🌧";
            }else if (i == 4){
                model.currentMin = @"18";
                model.currentMax = @"22";
                model.weekStr = @"周五";
                model.weatherStr = @"⛅️";
            }else if (i == 5){
                model.currentMin = @"18";
                model.currentMax = @"29";
                model.weekStr = @"周六";
                model.weatherStr = @"⛅️";
            }else if (i == 6){
                model.currentMin = @"22";
                model.currentMax = @"28";
                model.weekStr = @"周日";
                model.weatherStr = @"🌧";
            }else if (i == 7){
                model.currentMin = @"21";
                model.currentMax = @"26";
                model.weekStr = @"周一";
                model.weatherStr = @"⛅️";
            }else if (i == 8){
                model.currentMin = @"22";
                model.currentMax = @"24";
                model.weekStr = @"周二";
                model.weatherStr = @"🌧";
            }else if (i == 9){
                model.currentMin = @"23";
                model.currentMax = @"27";
                model.weekStr = @"周三";
                model.weatherStr = @"❄️";
            }else if (i == 10){
                model.currentMin = @"23";
                model.currentMax = @"28";
                model.weekStr = @"周四";
                model.weatherStr = @"⛅️";
            }else{
                model.currentMin = @"21";
                model.currentMax = @"28";
                model.weekStr = @"周五";
                model.weatherStr = @"🌧";
            }
            
            [self.dataArr addObject:model];
        }
    }
}

@end
