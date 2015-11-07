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

-(void)sk_setBackgroundPatternImagewithImageName:(NSString*)imageName {
    
    if( imageName == nil ) {
        return;
    }
    
    UIImage* image = [UIImage imageNamed:imageName];
    self.backgroundColor = [UIColor colorWithPatternImage:image];
    
}


/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark size

-(void)sk_setFrameHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(CGFloat)sk_frameHeight {
    return self.frame.size.height;
}

-(void)sk_setFrameWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
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

-(void)sk_setFrameSize:(CGSize)size {
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}

-(CGSize)sk_frameSize {
    return self.frame.size;
}

-(void)sk_setFrameOrigin:(CGPoint)origin {
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}

-(CGPoint)sk_frameOrigin {
    return self.frame.origin;
}

-(void)sk_setBoundsSize:(CGSize)size {
    CGRect rect = self.bounds;
    rect.size = size;
    self.bounds = rect;
}

-(CGSize)sk_boundsSize {
    return self.bounds.size;
}

-(void)sk_setBoundsOrigin:(CGPoint)origin {
    CGRect rect = self.bounds;
    rect.origin = origin;
    self.bounds = rect;
}

-(CGPoint)sk_boundsOrigin {
    return self.bounds.origin;
}

-(void)sk_setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(void)sk_setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}


/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark layer

-(void)sk_addGradientWithBlock:(void (^ _Nonnull)(CAGradientLayer* _Nonnull gradient))block {
    
    CAGradientLayer* gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    // 影にも角丸の設定をしないと、影が角丸にならなかった。
    // 影を付けるの前にcornerRadiusを設定している必要がある。
    gradient.cornerRadius = self.layer.cornerRadius;
    
    block(gradient);
    
    [self.layer insertSublayer:gradient atIndex:0];
}

// http://d.hatena.ne.jp/shu223/20121124/1355146393
-(void)sk_addShadowWithOpacity:(CGFloat)opacity radius:(CGFloat)radius offset:(CGSize)offset {
    
    // 必要?
    self.layer.masksToBounds = NO;
    
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
    self.layer.shadowOffset = offset;
    
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
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
