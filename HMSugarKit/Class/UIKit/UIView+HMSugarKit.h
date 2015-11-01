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

-(CGFloat)sk_frameHeight;
-(CGFloat)sk_frameWidth;
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




@end
