//
//  GFPickerView.m
//  rongcloud_testDemo
//
//  Created by WangGangFeng on 17/8/23.
//  Copyright © 2017年 WGF. All rights reserved.
//

#import "GFPickerView.h"
@interface GFPickerView ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, copy) NSString *dateStr;
@end
@implementation GFPickerView{
NSInteger yearRange;
NSInteger dayRange;
NSInteger startYear;
NSInteger selectedYear;
NSInteger selectedMonth;
NSInteger selectedDay;
NSInteger selectedHour;
NSInteger selectedMinute;
NSInteger selectedSecond;
NSCalendar *calendar;
//左边退出按钮
UIButton *cancelButton;
//右边的确定按钮
UIButton *chooseButton;
}

- (id)init {
    if (self = [super init]) {
        self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, 180)];
        self.pickerView.backgroundColor = [UIColor whiteColor]
        ;
        self.pickerView.dataSource=self;
        self.pickerView.delegate=self;
        [self addSubview:self.pickerView];
        //盛放按钮的View
        UIView *upVeiw = [[UIView alloc]initWithFrame:CGRectMake(-2, 0, [UIScreen mainScreen].bounds.size.width+4, 30)];
        upVeiw.backgroundColor = [UIColor colorWithHexString:@"EFEFF4"];
        [self addSubview:upVeiw];
        //左边的取消按钮
        cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.frame = CGRectMake(12, 0, 50, 30);
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        cancelButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [cancelButton setTitleColor:[UIColor colorWithHexString:@"1787FB"] forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(hiddenPickerView) forControlEvents:UIControlEventTouchUpInside];
        [upVeiw addSubview:cancelButton];
        
        //右边的确定按钮
        chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        chooseButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 50, 0, 50, 30);
        chooseButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [chooseButton setTitle:@"确定" forState:UIControlStateNormal];
        [chooseButton setTitleColor:[UIColor colorWithHexString:@"1787FB"] forState:UIControlStateNormal];
        [chooseButton addTarget:self action:@selector(hiddenPickerViewRight) forControlEvents:UIControlEventTouchUpInside];
        [upVeiw addSubview:chooseButton];
        
        NSCalendar *calendar0 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        NSInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
        comps = [calendar0 components:unitFlags fromDate:[NSDate date]];
        NSInteger year=[comps year];
        
        startYear = year-15;
        yearRange = 30;
        selectedYear = 2000;
        selectedMonth = 1;
        selectedDay = 1;
        selectedHour = 0;
        selectedMinute = 0;
        selectedSecond = 0;
        dayRange = [self isAllDay:startYear andMonth:1];
        [self hiddenPickerView];
        [self setCurDate:[NSDate date]];
    }
    return self;
}

#pragma mark -- UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 6;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch (component) {
        case 0:
        {
            return yearRange;
        }
            break;
        case 1:
        {
            return 12;
        }
            break;
        case 2:
        {
            return dayRange;
        }
            break;
        case 3:
        {
            return 24;
        }
            break;
        case 4:
        {
            return 60;
        }
            break;
        case 5:
        {
            return 60;
        }
            break;
        default:
            break;
    }
    return 0;
}

- (void)setCurDate:(NSDate *)curentDate {
    //获取当前时间
    NSCalendar *calendar0 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | kCFCalendarUnitSecond;
    comps = [calendar0 components:unitFlags fromDate:curentDate];
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    NSInteger hour = [comps hour];
    NSInteger minute = [comps minute];
    /** 秒 */
    NSInteger second = [comps second];
    
    selectedYear = year;
    selectedMonth = month;
    selectedDay = day;
    selectedHour = hour;
    selectedMinute = minute;
    selectedSecond = second;
    dayRange = [self isAllDay:year andMonth:month];
    
    [self.pickerView selectRow:year-startYear inComponent:0 animated:true];
    [self pickerView:self.pickerView didSelectRow:year-startYear inComponent:0];
    
    [self.pickerView selectRow:month-1 inComponent:1 animated:true];
    [self pickerView:self.pickerView didSelectRow:month-1 inComponent:1];
    
    [self.pickerView selectRow:day-1 inComponent:2 animated:true];
    [self pickerView:self.pickerView didSelectRow:day-1 inComponent:2];
    
    [self.pickerView selectRow:hour inComponent:3 animated:true];
    [self pickerView:self.pickerView didSelectRow:hour inComponent:3];
    
    [self.pickerView selectRow:minute inComponent:4 animated:true];
    [self pickerView:self.pickerView didSelectRow:minute inComponent:4];
    
    [self.pickerView selectRow:second inComponent:5 animated:true];
    [self pickerView:self.pickerView didSelectRow:minute inComponent:5];
    
    [self.pickerView reloadAllComponents];
}


- (UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel*label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*component/6.0, 0,SCREEN_WIDTH/6.0, 30)];
    label.font = [UIFont systemFontOfSize:15.0];
    label.tag = component*100+row;
    label.textAlignment = NSTextAlignmentCenter;
    switch (component) {
        case 0:
        {
            label.frame = CGRectMake(5, 0,SCREEN_WIDTH/4.0, 30);
            label.text = [NSString stringWithFormat:@"%ld年",(long)(startYear + row)];
        }
            break;
        case 1:
        {
            label.frame = CGRectMake(SCREEN_WIDTH/4.0, 0, SCREEN_WIDTH/8.0, 30);
            label.text = [NSString stringWithFormat:@"%ld月",(long)row+1];
        }
            break;
        case 2:
        {
            label.frame = CGRectMake(SCREEN_WIDTH*3/8, 0, SCREEN_WIDTH/8.0, 30);
            label.text = [NSString stringWithFormat:@"%ld日",(long)row+1];
        }
            break;
        case 3:
        {
            label.textAlignment = NSTextAlignmentRight;
            label.text = [NSString stringWithFormat:@"%ld时",(long)row];
        }
            break;
        case 4:
        {
            label.textAlignment = NSTextAlignmentRight;
            label.text = [NSString stringWithFormat:@"%ld分",(long)row];
        }
            break;
        case 5:
        {
            label.textAlignment = NSTextAlignmentRight;
            label.frame = CGRectMake(SCREEN_WIDTH*component/6.0, 0, SCREEN_WIDTH/6.0-5, 30);
            label.text = [NSString stringWithFormat:@"%ld秒",(long)row];
        }
            break;
            
        default:
            break;
    }
    return label;
}

// 监听picker的滑动
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (component) {
        case 0:
        {
            selectedYear = startYear + row;
            dayRange = [self isAllDay:selectedYear andMonth:selectedMonth];
            [self.pickerView reloadComponent:2];
        }
            break;
        case 1:
        {
            selectedMonth = row+1;
            dayRange = [self isAllDay:selectedYear andMonth:selectedMonth];
            [self.pickerView reloadComponent:2];
        }
            break;
        case 2:
        {
            selectedDay = row+1;
        }
            break;
        case 3:
        {
            selectedHour = row;
        }
            break;
        case 4:
        {
            selectedMinute = row;
        }
            break;
        case 5:
        {
            selectedSecond = row;
        }
            break;
        default:
            break;
    }
    
    _dateStr =[NSString stringWithFormat:@"%ld-%.2ld-%.2ld %.2ld:%.2ld:%.2ld",selectedYear,selectedMonth,selectedDay,selectedHour,selectedMinute,selectedSecond];
}

- (void)hiddenPickerView {
    if ([self.delegate respondsToSelector:@selector(hiddenPickerView)]) {
        [self.delegate hiddenPickerView];
    }
}

- (void)hiddenPickerViewRight {
    if ([self.delegate respondsToSelector:@selector(didFinishPickView:)]) {
        [self.delegate didFinishPickView:_dateStr];
    }
}

- (NSInteger)isAllDay:(NSInteger)year andMonth:(NSInteger)month
{
    int day=0;
    switch(month)
    {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            day = 31;
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            day = 30;
            break;
        case 2:
        {
            if(((year%4 == 0)&&(year%100 != 0))||(year%400 == 0)) {
                day = 29;
                break;
            } else
            {
                day = 28;
                break;
            }
        }
        default:
            break;
    }
    return day;
}



@end
