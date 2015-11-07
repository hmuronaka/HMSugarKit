//
//  UIView+HMSugarKit.h
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/10/12.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SKViewBlock)(UIView* _Nonnull view);

@interface UIView (HMSugarKit)

-(void)sk_traverseWithBlock:(SKViewBlock _Nullable)block;
-(UIImage* _Nonnull)sk_toImage;

-(void)sk_addGestureRecognizers:(NSArray* _Nullable)gestureRecognizers;
-(void)sk_removeGestureRecognizers:(NSArray* _Nullable)gestureRecognizers;

-(void)sk_setFrameHeight:(CGFloat)height;
-(CGFloat)sk_frameHeight;
-(void)sk_setFrameWidth:(CGFloat)width;
-(CGFloat)sk_frameX;
-(CGFloat)sk_frameY;

-(CGFloat)sk_boundsHeight;
-(CGFloat)sk_boundsWidth;
-(CGFloat)sk_boundsX;
-(CGFloat)sk_boundsY;

-(void)sk_setFrameSize:(CGSize)size;
-(CGSize)sk_frameSize;

-(void)sk_setFrameOrigin:(CGPoint)origin;
-(CGPoint)sk_frameOrigin;

-(void)sk_setBoundsSize:(CGSize)size;
-(CGSize)sk_originSize;

-(void)sk_setBoundsOrigin:(CGPoint)origin;
-(CGPoint)sk_originOrigin;

-(void)sk_setCenterX:(CGFloat)centerX;
-(void)sk_setCenterY:(CGFloat)centerY;


-(void)sk_addGradientWithBlock:(void (^ _Nonnull)(CAGradientLayer* _Nonnull gradient))block;
-(void)sk_addShadowWithOpacity:(CGFloat)opacity radius:(CGFloat)radius offset:(CGSize)offset;

-(void)sk_setBackgroundPatternImagewithImageName:(NSString* _Nullable)imageName;

@end
