//
//  UIViewController+HMSugarKit.m
//  CutAndLoop
//
//  Created by Muronaka Hiroaki on 2015/10/12.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UIViewController+HMSugarKit.h"

@implementation UIViewController (HMSugarKit)

+(instancetype)sk_createFromNib {
    NSString* className = NSStringFromClass(self);
    return [[NSClassFromString(className) alloc] initWithNibName:className bundle:nil];
}

@end
