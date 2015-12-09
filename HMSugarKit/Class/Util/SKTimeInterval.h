//
//  SKTimeInterval.h
//  CutAndLoop
//
//  Created by Muronaka Hiroaki on 2015/10/17.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKTimeInterval : NSObject

@property(nonatomic, assign) NSTimeInterval timeInterval;

-(instancetype)initWithTimeInterval:(NSTimeInterval)timeInterval;
-(instancetype)initWithMinute:(NSInteger)minute second:(NSInteger)second millisecond:(NSInteger)millisecond;
-(instancetype)initWithTimeIntervalNumber:(NSNumber*)timeIntervalNumber;

-(NSString*)toString;
+(NSString*)stringFromTimeInterval:(NSTimeInterval)timeInterval;
+(NSString*)stringFromTimeInterval:(NSTimeInterval)timeInterval format:(NSString*)format;
+(NSString*)stringFromTimeInterval:(NSTimeInterval)timeInterval format:(NSString*)format block:(void (^)(NSDateFormatter* formatter))block;
+(NSTimeInterval)timeIntervalFromMinute:(NSInteger)minute second:(NSInteger)second millisecond:(NSInteger)millisecond;

@end
