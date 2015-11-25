//
//  UINavigationController+HMSugarKit.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/11/24.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UINavigationController+HMSugarKit.h"
#import "UINavigationBar+HMSugarKit.h"

@implementation UINavigationController (HMSugarKit)

-(void)sk_setTitleForegroundColor:(UIColor *)color {
    [self.navigationBar sk_setTitleForegroundColor:color];
}

@end
