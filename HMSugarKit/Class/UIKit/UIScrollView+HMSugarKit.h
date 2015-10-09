//
//  UIScrollView+HMSugarKit.h
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/09.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (HMSugarKit)

-(void)sk_setContentOffsetX:(CGFloat)x;
-(void)sk_setContentOffsetY:(CGFloat)y;
-(void)sk_setContentOffsetX:(CGFloat)x y:(CGFloat)y;
-(void)sk_addContentOffsetX:(CGFloat)x;
-(void)sk_addContentOffsetY:(CGFloat)y;
-(void)sk_addContentOffsetX:(CGFloat)x y:(CGFloat)y;

@end
