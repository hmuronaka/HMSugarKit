//
//  UIView+HMSugarKit.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/10/12.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UIView+HMSugarKit.h"

@implementation UIView (HMSugarKit)

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark traverse

-(void)sk_traverseWithBlock:(SKViewBlock _Nullable)block {
    if( !block ) {
        return;
    }
    
    [self pr_traverseWithView:self block:block];
}

-(UIImage*)sk_toImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark util

-(void)sk_addGestureRecognizers:(NSArray*)gestureRecognizers {
    [gestureRecognizers enumerateObjectsUsingBlock:^(UIGestureRecognizer*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addGestureRecognizer:obj];
    }];
}

-(void)sk_removeGestureRecognizers:(NSArray*)gestureRecognizers {
    [gestureRecognizers enumerateObjectsUsingBlock:^(UIGestureRecognizer*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self removeGestureRecognizer:obj];
    }];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark size

-(CGFloat)sk_frameHeight {
    return self.frame.size.height;
}

-(CGFloat)sk_frameWidth {
    return self.frame.size.width;
}

-(CGFloat)sk_frameX {
    return self.frame.origin.x;
}

-(CGFloat)sk_frameY {
    return self.frame.origin.y;
}

-(CGFloat)sk_boundsHeight {
    return self.bounds.size.height;
}

-(CGFloat)sk_boundsWidth {
    return self.bounds.size.width;
}

-(CGFloat)sk_boundsX {
    return self.bounds.origin.x;
}

-(CGFloat)sk_boundsY {
    return self.bounds.origin.y;
}


/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark private

-(void)pr_traverseWithView:(UIView* _Nonnull)view block:(SKViewBlock _Nullable)block {
    block(view);
    
    [view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self pr_traverseWithView:obj block:block];
    }];
}

@end
