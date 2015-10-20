//
//  UIView+HMSugarKit.h
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/10/12.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SKViewBlock)(UIView* view);

@interface UIView (HMSugarKit)

-(void)sk_traverseWithBlock:(SKViewBlock _Nullable)block;

-(void)sk_addGestureRecognizers:(NSArray*)gestureRecognizers;
-(void)sk_removeGestureRecognizers:(NSArray*)gestureRecognizers;

@end
