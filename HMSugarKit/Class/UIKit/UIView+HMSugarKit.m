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
#pragma mark private

-(void)pr_traverseWithView:(UIView* _Nonnull)view block:(SKViewBlock _Nullable)block {
    block(view);
    
    [view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self pr_traverseWithView:obj block:block];
    }];
}

@end
