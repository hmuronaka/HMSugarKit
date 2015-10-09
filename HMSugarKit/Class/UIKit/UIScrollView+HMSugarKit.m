//
//  UIScrollView+HMSugarKit.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/09.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UIScrollView+HMSugarKit.h"

@implementation UIScrollView (HMSugarKit)

-(void)sk_setContentOffsetX:(CGFloat)x {
    self.contentOffset = CGPointMake(x, self.contentOffset.y);
}

-(void)sk_setContentOffsetY:(CGFloat)y {
    self.contentOffset = CGPointMake(self.contentOffset.x, y);
}

-(void)sk_setContentOffsetX:(CGFloat)x y:(CGFloat)y {
    self.contentOffset = CGPointMake(x, y);
}

-(void)sk_addContentOffsetX:(CGFloat)x {
    self.contentOffset = CGPointMake(self.contentOffset.x + x, self.contentOffset.y);
}

-(void)sk_addContentOffsetY:(CGFloat)y {
    self.contentOffset = CGPointMake(self.contentOffset.x, self.contentOffset.y + y);
}

-(void)sk_addContentOffsetX:(CGFloat)x y:(CGFloat)y {
    self.contentOffset = CGPointMake(self.contentOffset.x + x, self.contentOffset.y + y);
}

@end
