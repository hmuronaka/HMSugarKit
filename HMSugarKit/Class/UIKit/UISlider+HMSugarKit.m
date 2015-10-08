//
//  UISlider+HMSugarKit.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/08.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UISlider+HMSugarKit.h"
#import "SKStep.h"
#import <objc/runtime.h>

#define HMSugarKit_UISlider_Step "HMSugarKit_step"

@implementation UISlider (HMSugarKit)

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Step/Snapping

-(void)sk_setStep:(CGFloat)step {
    SKStep* obj = [[SKStep alloc] initWithStep:step];
    objc_setAssociatedObject(self, HMSugarKit_UISlider_Step, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGFloat)sk_step {
    SKStep* result = [self pr_getStepObject];
    if( result ) {
        return result.step;
    }
    return 0.0;
}


-(CGFloat)sk_snap {
    return [self sk_snapWithValue:self.value];
}

-(CGFloat)sk_snapWithValue:(CGFloat)value {
    SKStep* result = [self pr_getStepObject];
    return [result sk_snap:value];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark private

-(SKStep*)pr_getStepObject {
    return objc_getAssociatedObject(self, HMSugarKit_UISlider_Step);
}


@end
