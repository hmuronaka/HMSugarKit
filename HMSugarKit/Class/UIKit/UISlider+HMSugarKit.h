//
//  UISlider+HMSugarKit.h
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/08.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISlider (HMSugarKit)

-(void)sk_setStep:(CGFloat)step;
-(CGFloat)sk_step;
-(CGFloat)sk_snap;
-(CGFloat)sk_snapWithValue:(CGFloat)value;

@end
