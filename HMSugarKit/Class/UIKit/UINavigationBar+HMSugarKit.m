//
//  UINavigationBar+HMSugarKit.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/11/24.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UINavigationBar+HMSugarKit.h"

@implementation UINavigationBar (HMSugarKit)

-(void)sk_setTitleForegroundColor:(UIColor*)color {
    NSMutableDictionary* titleTextAttribute = [self.titleTextAttributes mutableCopy] ?: [NSMutableDictionary new];
    titleTextAttribute[NSForegroundColorAttributeName] = color;
    self.titleTextAttributes = titleTextAttribute;
}

@end
