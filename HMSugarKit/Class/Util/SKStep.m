//
//  SKStep.m
//  SKSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/08.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "SKStep.h"

@implementation SKStep

-(instancetype)initWithStep:(double)step {
    self = [super init];
    if( self ) {
        _step = step;
    }
    return self;
}

-(double)sk_snap:(double)value {
    double newStep = fabs(roundf(value / self.step));
    return newStep * self.step * (value < 0 ? -1 : 1);
}

@end
