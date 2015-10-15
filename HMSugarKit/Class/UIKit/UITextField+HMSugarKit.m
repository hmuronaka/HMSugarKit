//
//  UITextField+HMSugarKit.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/14.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UITextField+HMSugarKit.h"

@implementation UITextField (HMSugarKit)

-(void)sk_setTextFromDouble:(double)value {
    self.text = [NSString stringWithFormat:@"%lf",value];
}

-(void)sk_setTextFromInt:(int)value {
    self.text = [NSString stringWithFormat:@"%d",value];
}


@end
