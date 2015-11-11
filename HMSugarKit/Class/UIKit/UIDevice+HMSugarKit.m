//
//  UIDevice+HMSugarKit.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/11/11.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UIDevice+HMSugarKit.h"

@implementation UIDevice (HMSugarKit)

-(BOOL)sk_isIPad {
    NSString* model = [UIDevice currentDevice].model;
    return [model hasPrefix:@"iPad"];
}

@end
