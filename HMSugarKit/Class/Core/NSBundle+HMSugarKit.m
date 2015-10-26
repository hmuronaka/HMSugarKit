//
//  NSBundle+HMSugarKit.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/10/18.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "NSBundle+HMSugarKit.h"

@implementation NSBundle (HMSugarKit)

-(BOOL)sk_isExistNibWithName:(NSString*)nibName {
    return [[NSBundle bundleForClass:self.class] pathForResource:nibName ofType:@"xib"];
}

@end
