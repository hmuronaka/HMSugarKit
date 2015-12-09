//
//  NSNumber+HMSugarKit.h
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/09/29.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef HMSugarKitHeader
typedef void (^VoidBlock)();
typedef void (^IndexBlock)(NSUInteger index);
#endif

BOOL sk_isEqualFloatWithEpsilon(float v1, float v2, float epsilon);
BOOL sk_isEqualFloat(float v1, float v2);
BOOL sk_isEqualDoubleWithEpsilon(double v1, double v2, double epsilon);
BOOL sk_isEqualDouble(double v1, double v2);

#define sk_nsnumberize(val) @(val)

@interface NSNumber (HMSugarKit)

-(NSNumber*)sk_incrementChar;
-(NSNumber*)sk_incrementShort;
-(NSNumber*)sk_incrementInt;
-(NSNumber*)sk_incrementUInt;
-(NSNumber*)sk_incrementLong;
-(NSNumber*)sk_incrementLongLong;

-(NSNumber*)sk_decrementChar;
-(NSNumber*)sk_decrementShort;
-(NSNumber*)sk_decrementInt;
-(NSNumber*)sk_decrementUInt;
-(NSNumber*)sk_decrementLong;
-(NSNumber*)sk_decrementLongLong;

-(NSNumber*)sk_addChar:(char)val;
-(NSNumber*)sk_addShort:(short)val;
-(NSNumber*)sk_addInt:(int)val;
-(NSNumber*)sk_addUInt:(unsigned int)val;
-(NSNumber*)sk_addLong:(long)val;
-(NSNumber*)sk_addLongLong:(long long)val;

-(NSNumber*)sk_minusChar:(char)val;
-(NSNumber*)sk_minusShort:(short)val;
-(NSNumber*)sk_minusInt:(int)val;
-(NSNumber*)sk_minusUInt:(unsigned int)val;
-(NSNumber*)sk_minusLong:(long)val;
-(NSNumber*)sk_minusLongLong:(long long)val;

-(BOOL)sk_isDoubleNaN;


-(void)sk_times:(VoidBlock)block;
-(void)sk_timesWithIndex:(IndexBlock)block;

-(NSTimeInterval)sk_toTimeInterval;

@end
