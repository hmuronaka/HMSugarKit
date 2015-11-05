//
//  UIView+HMSugarKit_Quartz.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/11/02.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UIView+HMSugarKit_Quartz.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (HMSugarKit_Quartz)

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark layer

-(void)sk_roundCornerWithRadius:(CGFloat)radious {
    if( !self.clipsToBounds ) {
        self.clipsToBounds = YES;
    }
    self.layer.cornerRadius = radious;
}

@end
