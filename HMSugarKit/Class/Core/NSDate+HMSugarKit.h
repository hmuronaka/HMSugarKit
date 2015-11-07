/*
 Original from https://github.com/erica/NSDate-Extensions/blob/master/NSDate%2BUtilities.h
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook 3.x and beyond
 BSD License, Use at your own risk
 */

//
//  NSDate+HMSugarKit.h
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/09/30.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSUInteger SK_DATE_MINUTE;
extern const NSUInteger SK_DATE_HOUR;
extern const NSUInteger SK_DATE_DAY;
extern const NSUInteger SK_DATE_WEEK;
extern const NSUInteger SK_DATE_YEAR;

@interface NSDate (HMSugarKit)

+ (NSCalendar * _Nonnull) sk_currentCalendar; // avoid bottlenecks

// Relative dates from the current date
+ (NSDate * _Nonnull)sk_dateTomorrow;
+ (NSDate * _Nonnull)sk_dateYesterday;
+ (NSDate * _Nonnull)sk_dateWithDaysFromNow:(NSInteger)days;
+ (NSDate * _Nonnull)sk_dateWithDaysBeforeNow:(NSInteger)days;
+ (NSDate * _Nonnull)sk_dateWithHoursFromNow:(NSInteger)dHours;
+ (NSDate * _Nonnull)sk_dateWithHoursBeforeNow:(NSInteger)dHours;
+ (NSDate * _Nonnull)sk_dateWithMinutesFromNow:(NSInteger)dMinutes;
+ (NSDate * _Nonnull)sk_dateWithMinutesBeforeNow:(NSInteger)dMinutes;

// Short string utilities
- (NSString * _Nonnull) sk_stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle;
- (NSString * _Nonnull) sk_stringWithFormat: (NSString * _Nonnull) format;
+ (NSDate* _Nullable) sk_dateFromString:(NSString* _Nullable)dateString format:(NSString* _Nonnull)format;

@property (nonatomic, readonly) NSString * _Nonnull sk_shortString;
@property (nonatomic, readonly) NSString * _Nonnull sk_shortDateString;
@property (nonatomic, readonly) NSString * _Nonnull sk_shortTimeString;
@property (nonatomic, readonly) NSString * _Nonnull sk_mediumString;
@property (nonatomic, readonly) NSString * _Nonnull sk_mediumDateString;
@property (nonatomic, readonly) NSString * _Nonnull sk_mediumTimeString;
@property (nonatomic, readonly) NSString * _Nonnull sk_longString;
@property (nonatomic, readonly) NSString * _Nonnull sk_longDateString;
@property (nonatomic, readonly) NSString * _Nonnull sk_longTimeString;
   

// Comparing dates
-(BOOL)sk_isEqualToDateIgnoringTime: (NSDate * _Nullable) aDate;

-(BOOL)sk_isToday;
-(BOOL)sk_isTomorrow;
-(BOOL)sk_isYesterday;

-(BOOL) sk_isSameWeekdayAsDate: (NSDate * _Nullable) aDate;
-(BOOL)sk_isThisWeek;
-(BOOL)sk_isNextWeek;
-(BOOL)sk_isLastWeek;

-(BOOL)sk_isSameMonthAsDate: (NSDate * _Nullable) aDate;
-(BOOL)sk_isThisMonth;
-(BOOL)sk_isNextMonth;
-(BOOL)sk_isLastMonth;

-(BOOL)sk_isSameYearAsDate: (NSDate * _Nullable) aDate;
-(BOOL)sk_isThisYear;
-(BOOL)sk_isNextYear;
-(BOOL)sk_isLastYear;

-(BOOL)sk_isEarlierThanDate: (NSDate * _Nullable) aDate;
-(BOOL)sk_isLaterThanDate: (NSDate * _Nullable) aDate;

-(BOOL)sk_isInFuture;
-(BOOL)sk_isInPast;

// Date roles
- (BOOL) sk_isTypicallyWorkday;
- (BOOL) sk_isTypicallyWeekend;

// Adjusting dates
- (NSDate * _Nonnull) sk_dateByAddingYears: (NSInteger) dYears;
- (NSDate * _Nonnull) sk_dateBySubtractingYears: (NSInteger) dYears;
- (NSDate * _Nonnull) sk_dateByAddingMonths: (NSInteger) dMonths;
- (NSDate * _Nonnull) sk_dateBySubtractingMonths: (NSInteger) dMonths;
- (NSDate * _Nonnull) sk_dateByAddingDays: (NSInteger) dDays;
- (NSDate * _Nonnull) sk_dateBySubtractingDays: (NSInteger) dDays;
- (NSDate * _Nonnull) sk_dateByAddingHours: (NSInteger) dHours;
- (NSDate * _Nonnull) sk_dateBySubtractingHours: (NSInteger) dHours;
- (NSDate * _Nonnull) sk_dateByAddingMinutes: (NSInteger) dMinutes;
- (NSDate * _Nonnull) sk_dateBySubtractingMinutes: (NSInteger) dMinutes;

// Date extremes
- (NSDate * _Nonnull) sk_dateAtStartOfDay;
- (NSDate * _Nonnull) sk_dateAtEndOfDay;

- (NSDate * _Nonnull) sk_dateAtStartOfMonth;

// Retrieving intervals
- (NSInteger) sk_minutesAfterDate: (NSDate * _Nullable) aDate;
- (NSInteger) sk_minutesBeforeDate: (NSDate * _Nullable) aDate;
- (NSInteger) sk_hoursAfterDate: (NSDate * _Nullable) aDate;
- (NSInteger) sk_hoursBeforeDate: (NSDate * _Nullable) aDate;
- (NSInteger) sk_daysAfterDate: (NSDate * _Nullable) aDate;
- (NSInteger) sk_daysBeforeDate: (NSDate * _Nullable) aDate;
- (NSInteger) sk_distanceInDaysToDate:(NSDate * _Nullable)anotherDate;

// Decomposing dates
@property (readonly) NSInteger sk_nearestHour;
@property (readonly) NSInteger sk_hour;
@property (readonly) NSInteger sk_minute;
@property (readonly) NSInteger sk_seconds;
@property (readonly) NSInteger sk_day;
@property (readonly) NSInteger sk_month;
@property (readonly) NSInteger sk_week;
@property (readonly) NSInteger sk_weekday;
@property (readonly) NSInteger sk_nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger sk_year;


@end

