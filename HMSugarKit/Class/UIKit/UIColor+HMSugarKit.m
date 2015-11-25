//
//  UIColor+HMSugarKit.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/11/25.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UIColor+HMSugarKit.h"

@implementation UIColor (HMSugarKit)

+(UIColor*)sk_colorWithRedInt:(NSInteger)red greenInt:(NSInteger)green blueInt:(NSInteger)blue alphaInt:(NSInteger)alpha {
    
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha / 255.0];
    
}

@end
