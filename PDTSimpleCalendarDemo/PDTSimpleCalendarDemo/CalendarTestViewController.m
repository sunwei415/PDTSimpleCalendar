//
// Created by Wei Sun on 24/04/2017.
// Copyright (c) 2017 Producteev. All rights reserved.
//

#import "CalendarTestViewController.h"
#import "PDTSimpleCalendarViewWeekdayHeader.h"
#import "PDTSimpleCalendarViewController.h"
#import "View+MASAdditions.h"

@interface CalendarTestViewController()<PDTSimpleCalendarViewDelegate>
@end

@implementation CalendarTestViewController {

}

- (void)viewDidLoad {
    PDTSimpleCalendarViewController *calendarViewController = [[PDTSimpleCalendarViewController alloc] init];
    //This is the default behavior, will display a full year starting the first of the current month
    [calendarViewController setDelegate:self];
    calendarViewController.weekdayHeaderEnabled = YES;
    calendarViewController.weekdayTextType = PDTSimpleCalendarViewWeekdayTextTypeVeryShort;

    [self addChildViewController:calendarViewController];

    [self.view addSubview:calendarViewController.view];

    [calendarViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.right.bottom.equalTo(self.view);
    }];
}
@end
