//
//  NSNumber+HMSugarKit.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/09/29.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "NSNumber+HMSugarKit.h"

BOOL sk_isEqualFloatWithEpsilon(float v1, float v2, float epsilon) {
    return fabsf(v1 - v2) <= epsilon;
}

BOOL sk_isEqualFloat(float v1, float v2) {
    return sk_isEqualFloatWithEpsilon(v1, v2, FLT_EPSILON);
}

BOOL sk_isEqualDoubleWithEpsilon(double v1, double v2, double epsilon) {
    return fabs(v1 - v2) <= epsilon;
}

BOOL sk_isEqualDouble(double v1, double v2) {
    return sk_isEqualDoubleWithEpsilon(v1, v2, DBL_EPSILON);
}

@implementation NSNumber (HMSugarKit)

#pragma mark increment

-(NSNumber*)sk_incrementChar {
    return @([self charValue] + 1);
}

-(NSNumber*)sk_incrementShort {
    return @([self shortValue] + 1);
}

-(NSNumber*)sk_incrementInt {
    return @([self intValue] + 1);
}

-(NSNumber*)sk_incrementUInt {
    return @([self unsignedIntValue] + 1);
}

-(NSNumber*)sk_incrementLong{
    return @([self longValue] + 1);
}

-(NSNumber*)sk_incrementLongLong {
    return @([self longLongValue] + 1);
}

#pragma mark decrement

-(NSNumber*)sk_decrementChar {
    return @([self charValue] - 1);
}

-(NSNumber*)sk_decrementShort {
    return @([self shortValue] - 1);
}

-(NSNumber*)sk_decrementInt {
    return @([self intValue] - 1);
}

-(NSNumber*)sk_decrementUInt {
    return @([self unsignedIntValue] - 1);
}

-(NSNumber*)sk_decrementLong{
    return @([self longValue] - 1);
}

-(NSNumber*)sk_decrementLongLong {
    return @([self longLongValue] - 1);
}

#pragma mark add

-(NSNumber*)sk_addChar:(char)val {
    return @([self charValue] + val);
}

-(NSNumber*)sk_addShort:(short)val {
    return @([self shortValue] + val);
}

-(NSNumber*)sk_addInt:(int)val {
    return @([self intValue] + val);
}

-(NSNumber*)sk_addUInt:(unsigned int)val {
    return @([self unsignedIntValue] + val);
}

-(NSNumber*)sk_addLong:(long)val {
    return @([self longValue] + val);
}

-(NSNumber*)sk_addLongLong:(long long)val {
    return @([self longLongValue] + val);
}

#pragma mark minus

-(NSNumber*)sk_minusChar:(char)val {
    return @([self charValue] - val);
}

-(NSNumber*)sk_minusShort:(short)val {
    return @([self shortValue] - val);
}

-(NSNumber*)sk_minusInt:(int)val {
    return @([self intValue] - val);
}

-(NSNumber*)sk_minusUInt:(unsigned int)val {
    return @([self unsignedIntValue] - val);
}

-(NSNumber*)sk_minusLong:(long)val {
    return @([self longValue] - val);
}

-(NSNumber*)sk_minusLongLong:(long long)val {
    return @([self longLongValue] - val);
}

#pragma mark block

-(void)sk_times:(VoidBlock)block {
    for(int i = 0; i < self.intValue; i++) {
        block();
    }
}

-(void)sk_timesWithIndex:(IndexBlock)block {
    for(int i = 0; i < self.intValue; i++) {
        block(i);
    }
}

#pragma mark convert

-(NSTimeInterval)sk_toTimeInterval {
    return [self doubleValue];
}

@end
