//
//  UIButton+HMSugarKit.h
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/11/25.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HMSugarKit)

-(void)sk_setImageName:(NSString*)name forState:(UIControlState)controlState;
-(void)sk_setImageName:(NSString*)name forState:(UIControlState)controlState block:(void (^)(UIImage* image))block;

@end
