//
//  SKTimeInterval.m
//  CutAndLoop
//
//  Created by Muronaka Hiroaki on 2015/10/17.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "SKTimeInterval.h"

@implementation SKTimeInterval

-(instancetype)initWithTimeInterval:(NSTimeInterval)timeInterval {
    self = [super init];
    if( self ) {
        self.timeInterval = timeInterval;
    }
    return self;
}

-(instancetype)initWithMinute:(NSInteger)minute second:(NSInteger)second millisecond:(NSInteger)millisecond {
    self = [super init];
    if( self ) {
        self.timeInterval = [[self class] timeIntervalFromMinute:minute second:second millisecond:millisecond];
    }
    return self;
}

-(instancetype)initWithTimeIntervalNumber:(NSNumber*)timeIntervalNumber {
    self = [super init];
    if( self ) {
        self.timeInterval = [timeIntervalNumber doubleValue];
    }
    return self;
}

-(NSString*)toString {
    return [[self class] stringFromTimeInterval:self.timeInterval];
}

+(NSString*)stringFromTimeInterval:(NSTimeInterval)timeInterval {
    return [self stringFromTimeInterval:timeInterval format:@"mm:ss.S"];
}

+(NSString*)stringFromTimeInterval:(NSTimeInterval)timeInterval format:(NSString*)format {
    return [self stringFromTimeInterval:timeInterval format:format block:nil];
}

+(NSString*)stringFromTimeInterval:(NSTimeInterval)timeInterval format:(NSString*)format block:(void (^)(NSDateFormatter* formatter))block {
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970: timeInterval];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    if( block ) {
        block(formatter);
    }
    NSString* str = [formatter stringFromDate:date];
    return str;
}

+(NSTimeInterval)timeIntervalFromMinute:(NSInteger)minute second:(NSInteger)second millisecond:(NSInteger)millisecond {
    NSTimeInterval result = 0;
    result = minute * 60 + second + ((NSTimeInterval)millisecond / 1000);
    return result;
}



@end
