//
//  UIButton+HMSugarKit.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/11/25.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UIButton+HMSugarKit.h"

@implementation UIButton (HMSugarKit)

-(void)sk_setImageName:(NSString*)name forState:(UIControlState)controlState {
    [self sk_setImageName:name forState:controlState block:nil];
}

-(void)sk_setImageName:(NSString*)name forState:(UIControlState)controlState block:(void (^)(UIImage* image))block {
    
    UIImage* image = [UIImage imageNamed:name];
    if(block) {
        block(image);
    }
    [self setImage:image forState:controlState];
}


@end
