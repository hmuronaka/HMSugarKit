//
//  NSString+HMSugarKit.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/26.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "NSString+HMSugarKit.h"

@implementation NSString (HMSugarKit)

-(NSString*)sk_strip {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
