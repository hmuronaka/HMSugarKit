/*
 Original from https://github.com/erica/NSDate-Extensions/blob/master/NSDate%2BUtilities.m
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook 3.x and beyond
 BSD License, Use at your own risk
 */


//
//  NSDate+HMSugarKit.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/09/30.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+HMSugarKit.h"

const NSUInteger SK_DATE_MINUTE = 60;
const NSUInteger SK_DATE_HOUR   = 3600;    
const NSUInteger SK_DATE_DAY    = 86400;   
const NSUInteger SK_DATE_WEEK   = 604800;  
const NSUInteger SK_DATE_YEAR   = 31556926;

// Thanks, AshFurrow
static const unsigned componentFlags = (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfYear |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);

@implementation NSDate (HMSugarKit)

+ (NSCalendar*)sk_currentCalendar {
    static NSCalendar *_sharedCalendar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    });
    return _sharedCalendar;
}


#pragma mark - Relative Dates

+ (NSDate *) sk_dateWithDaysFromNow: (NSInteger) days
{
    // Thanks, Jim Morrison
    return [[NSDate date] sk_dateByAddingDays:days];
}

+ (NSDate *) sk_dateWithDaysBeforeNow: (NSInteger) days
{
    // Thanks, Jim Morrison
    return [[NSDate date] sk_dateBySubtractingDays:days];
}

+ (NSDate *) sk_dateTomorrow
{
    return [NSDate sk_dateWithDaysFromNow:1];
}

+ (NSDate *) sk_dateYesterday
{
    return [NSDate sk_dateWithDaysBeforeNow:1];
}

+ (NSDate *) sk_dateWithHoursFromNow: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + SK_DATE_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) sk_dateWithHoursBeforeNow: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - SK_DATE_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) sk_dateWithMinutesFromNow: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + SK_DATE_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) sk_dateWithMinutesBeforeNow: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - SK_DATE_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - String Properties
- (NSString *) sk_stringWithFormat: (NSString *) format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSString *) sk_stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    return [formatter stringFromDate:self];
}

- (NSString *) sk_shortString
{
    return [self sk_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *) sk_shortTimeString
{
    return [self sk_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *) sk_shortDateString
{
    return [self sk_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) sk_mediumString
{
    return [self sk_stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *) sk_mediumTimeString
{
    return [self sk_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *) sk_mediumDateString
{
    return [self sk_stringWithDateStyle:NSDateFormatterMediumStyle  timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) sk_longString
{
    return [self sk_stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *) sk_longTimeString
{
    return [self sk_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *) sk_longDateString
{
    return [self sk_stringWithDateStyle:NSDateFormatterLongStyle  timeStyle:NSDateFormatterNoStyle];
}

#pragma mark - Comparing Dates

- (BOOL) sk_isEqualToDateIgnoringTime: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate sk_currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate sk_currentCalendar] components:componentFlags fromDate:aDate];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

- (BOOL) sk_isToday
{
    return [self sk_isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL) sk_isTomorrow
{
    return [self sk_isEqualToDateIgnoringTime:[NSDate sk_dateTomorrow]];
}

- (BOOL) sk_isYesterday
{
    return [self sk_isEqualToDateIgnoringTime:[NSDate sk_dateYesterday]];
}

// This hard codes the assumption that a week is 7 days
- (BOOL) sk_isSameWeekdayAsDate: (NSDate *) aDate {
    NSDateComponents *components1 = [[NSDate sk_currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate sk_currentCalendar] components:componentFlags fromDate:aDate];
    
    // Must be same week. 12/31 and 1/1 will both be week "1" if they are in the same week
    if (components1.weekday != components2.weekday) return NO;
    
    // Must have a time interval under 1 week. Thanks @aclark
    return (fabs([self timeIntervalSinceDate:aDate]) < SK_DATE_WEEK);
}

- (BOOL) sk_isThisWeek
{
    return [self sk_isSameWeekdayAsDate:[NSDate date]];
}

- (BOOL) sk_isNextWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + SK_DATE_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self sk_isSameWeekdayAsDate:newDate];
}

- (BOOL) sk_isLastWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - SK_DATE_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self sk_isSameWeekdayAsDate:newDate];
}

// Thanks, mspasov
- (BOOL) sk_isSameMonthAsDate: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate sk_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    NSDateComponents *components2 = [[NSDate sk_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    return ((components1.month == components2.month) &&
            (components1.year == components2.year));
}

- (BOOL) sk_isThisMonth
{
    return [self sk_isSameMonthAsDate:[NSDate date]];
}

// Thanks Marcin Krzyzanowski, also for adding/subtracting years and months
- (BOOL) sk_isLastMonth
{
    return [self sk_isSameMonthAsDate:[[NSDate date] sk_dateBySubtractingMonths:1]];
}

- (BOOL) sk_isNextMonth
{
    return [self sk_isSameMonthAsDate:[[NSDate date] sk_dateByAddingMonths:1]];
}

- (BOOL) sk_isSameYearAsDate: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate sk_currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate sk_currentCalendar] components:NSCalendarUnitYear fromDate:aDate];
    return (components1.year == components2.year);
}

- (BOOL) sk_isThisYear
{
    // Thanks, baspellis
    return [self sk_isSameYearAsDate:[NSDate date]];
}

- (BOOL) sk_isNextYear
{
    NSDateComponents *components1 = [[NSDate sk_currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate sk_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return (components1.year == (components2.year + 1));
}

- (BOOL) sk_isLastYear
{
    NSDateComponents *components1 = [[NSDate sk_currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate sk_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return (components1.year == (components2.year - 1));
}

- (BOOL) sk_isEarlierThanDate: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedAscending);
}

- (BOOL) sk_isLaterThanDate: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedDescending);
}

// Thanks, markrickert
- (BOOL) sk_isInFuture
{
    return ([self sk_isLaterThanDate:[NSDate date]]);
}

// Thanks, markrickert
- (BOOL) sk_isInPast
{
    return ([self sk_isEarlierThanDate:[NSDate date]]);
}


#pragma mark - Roles
- (BOOL) sk_isTypicallyWeekend
{
    NSDateComponents *components = [[NSDate sk_currentCalendar] components:NSCalendarUnitWeekday fromDate:self];
    if ((components.weekday == 1) ||
        (components.weekday == 7))
        return YES;
    return NO;
}

- (BOOL) sk_isTypicallyWorkday
{
    return ![self sk_isTypicallyWeekend];
}

#pragma mark - Adjusting Dates

// Thaks, rsjohnson
- (NSDate *) sk_dateByAddingYears: (NSInteger) dYears
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:dYears];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) sk_dateBySubtractingYears: (NSInteger) dYears
{
    return [self sk_dateByAddingYears:-dYears];
}

- (NSDate *) sk_dateByAddingMonths: (NSInteger) dMonths
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:dMonths];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) sk_dateBySubtractingMonths: (NSInteger) dMonths
{
    return [self sk_dateByAddingMonths:-dMonths];
}

// Courtesy of dedan who mentions issues with Daylight Savings
- (NSDate *) sk_dateByAddingDays: (NSInteger) dDays
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:dDays];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) sk_dateBySubtractingDays: (NSInteger) dDays
{
    return [self sk_dateByAddingDays: (dDays * -1)];
}

- (NSDate *) sk_dateByAddingHours: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + SK_DATE_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *) sk_dateBySubtractingHours: (NSInteger) dHours
{
    return [self sk_dateByAddingHours: (dHours * -1)];
}

- (NSDate *) sk_dateByAddingMinutes: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + SK_DATE_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *) sk_dateBySubtractingMinutes: (NSInteger) dMinutes
{
    return [self sk_dateByAddingMinutes: (dMinutes * -1)];
}

- (NSDateComponents *) sk_componentsWithOffsetFromDate: (NSDate *) aDate
{
    NSDateComponents *dTime = [[NSDate sk_currentCalendar] components:componentFlags fromDate:aDate toDate:self options:0];
    return dTime;
}

#pragma mark - Extremes

- (NSDate *) sk_dateAtStartOfDay
{
    NSDateComponents *components = [[NSDate sk_currentCalendar] components:componentFlags fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [[NSDate sk_currentCalendar] dateFromComponents:components];
}

// Thanks gsempe & mteece
- (NSDate *) sk_dateAtEndOfDay
{
    NSDateComponents *components = [[NSDate sk_currentCalendar] components:componentFlags fromDate:self];
    components.hour = 23; // Thanks Aleksey Kononov
    components.minute = 59;
    components.second = 59;
    return [[NSDate sk_currentCalendar] dateFromComponents:components];
}

#pragma mark - Retrieving Intervals

- (NSInteger) sk_minutesAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / SK_DATE_MINUTE);
}

- (NSInteger) sk_minutesBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / SK_DATE_MINUTE);
}

- (NSInteger) sk_hoursAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / SK_DATE_HOUR);
}

- (NSInteger) sk_hoursBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / SK_DATE_HOUR);
}

- (NSInteger) sk_daysAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / SK_DATE_DAY);
}

- (NSInteger) sk_daysBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / SK_DATE_DAY);
}

// Thanks, dmitrydims
// I have not yet thoroughly tested this
- (NSInteger)sk_distanceInDaysToDate:(NSDate *)anotherDate
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay fromDate:self toDate:anotherDate options:0];
    return components.day;
}

#pragma mark - Decomposing Dates

- (NSInteger) sk_nearestHour
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + SK_DATE_MINUTE * 30;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    NSDateComponents *components = [[NSDate sk_currentCalendar] components:NSCalendarUnitHour fromDate:newDate];
    return components.hour;
}

- (NSInteger) sk_hour
{
    NSDateComponents *components = [[NSDate sk_currentCalendar] components:componentFlags fromDate:self];
    return components.hour;
}

- (NSInteger) sk_minute
{
    NSDateComponents *components = [[NSDate sk_currentCalendar] components:componentFlags fromDate:self];
    return components.minute;
}

- (NSInteger) sk_seconds
{
    NSDateComponents *components = [[NSDate sk_currentCalendar] components:componentFlags fromDate:self];
    return components.second;
}

- (NSInteger) sk_day
{
    NSDateComponents *components = [[NSDate sk_currentCalendar] components:componentFlags fromDate:self];
    return components.day;
}

- (NSInteger) sk_month
{
    NSDateComponents *components = [[NSDate sk_currentCalendar] components:componentFlags fromDate:self];
    return components.month;
}

- (NSInteger) sk_week
{
    NSDateComponents *components = [[NSDate sk_currentCalendar] components:componentFlags fromDate:self];
    return components.week;
}

- (NSInteger) sk_weekday
{
    NSDateComponents *components = [[NSDate sk_currentCalendar] components:componentFlags fromDate:self];
    return components.weekday;
}

- (NSInteger) sk_nthWeekday // e.g. 2nd Tuesday of the month is 2
{
    NSDateComponents *components = [[NSDate sk_currentCalendar] components:componentFlags fromDate:self];
    return components.weekdayOrdinal;
}

- (NSInteger) sk_year
{
    NSDateComponents *components = [[NSDate sk_currentCalendar] components:componentFlags fromDate:self];
    return components.year;
}
@end
