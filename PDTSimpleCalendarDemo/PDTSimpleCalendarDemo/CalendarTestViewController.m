//
// Created by Wei Sun on 24/04/2017.
// Copyright (c) 2017 Producteev. All rights reserved.
//

#import "CalendarTestViewController.h"
#import "PDTSimpleCalendarViewWeekdayHeader.h"
#import "PDTSimpleCalendarViewController.h"
#import "View+MASAdditions.h"
#import "PDTSimpleCalendarViewCell.h"

@interface CalendarTestViewController()<PDTSimpleCalendarViewDelegate>
@end

@implementation CalendarTestViewController {

}

- (void)viewDidLoad {

    [self initCustomDates];

    PDTSimpleCalendarViewController *calendarViewController = [[PDTSimpleCalendarViewController alloc] init];
    //This is the default behavior, will display a full year starting the first of the current month
    [calendarViewController setDelegate:self];
    calendarViewController.weekdayHeaderEnabled = YES;
    calendarViewController.weekdayTextType = PDTSimpleCalendarViewWeekdayTextTypeVeryShort;

    [[PDTSimpleCalendarViewCell appearance] setTextDefaultColor:[UIColor whiteColor]];

    [[PDTSimpleCalendarViewCell appearance] setCircleDefaultColor:[UIColor clearColor]];

    [[PDTSimpleCalendarViewCell appearance] setTextDefaultFont:[UIFont fontWithName:@"HYQiHei-EES" size:14]];

    [[PDTSimpleCalendarViewWeekdayHeader appearance] setHeaderBackgroundColor:[UIColor colorWithRed:44.f/255 green:84.f/255 blue:141.f/255 alpha:1.0]];

    [[PDTSimpleCalendarViewWeekdayHeader appearance] setTextColor:[UIColor whiteColor]];

    [self addChildViewController:calendarViewController];

    calendarViewController.backgroundColor = [UIColor colorWithRed:78.f/255 green:121.f/255 blue:179.f/255 alpha:1.0];

    [self.view addSubview:calendarViewController.view];

    [calendarViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.right.bottom.equalTo(self.view);
    }];
}

#pragma mark - PDTSimpleCalendarViewDelegate

- (void)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller didSelectDate:(NSDate *)date
{
    NSLog(@"Date Selected : %@",date);
    NSLog(@"Date Selected with Locale %@", [date descriptionWithLocale:[NSLocale systemLocale]]);
}

- (BOOL)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller shouldUseCustomColorsForDate:(NSDate *)date
{
    if ([self.customDates containsObject:date]) {
        return YES;
    }

    return NO;
}

- (UIColor *)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller circleColorForDate:(NSDate *)date
{
    return [UIColor clearColor];
}

- (UIColor *)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller textColorForDate:(NSDate *)date
{
    return [UIColor colorWithRed:251.f/255 green:199.f/255 blue:7.f/255 alpha:1.0];
}

#pragma mark - Private

//Add 3 custom dates, the 15th for the current & 2 next months.
- (void)initCustomDates
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth|NSCalendarUnitYear fromDate:[NSDate date]];
    components.day = 15;
    NSDate *date1 = [[NSCalendar currentCalendar] dateFromComponents:components];
    NSDateComponents *addOneMonthComponents = [[NSDateComponents alloc] init];
    addOneMonthComponents.month =1;
    NSDate *date2 = [[NSCalendar currentCalendar] dateByAddingComponents:addOneMonthComponents toDate:date1 options:0];
    NSDate *date3 = [[NSCalendar currentCalendar] dateByAddingComponents:addOneMonthComponents toDate:date2 options:0];
    self.customDates = @[date1, date2, date3];
}
@end
