//
//  UIApplication+HMSugarKit.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2016/02/17.
//  Copyright © 2016年 Muronaka Hiroaki. All rights reserved.
//

#import "UIApplication+HMSugarKit.h"

@implementation UIApplication (HMSugarKit)

-(UIViewController*)sk_mostTopViewController {
    
    UIViewController* result = self.keyWindow.rootViewController;
    while( result.presentedViewController ) {
        result = result.presentedViewController;
    }
    return result;
}

@end
