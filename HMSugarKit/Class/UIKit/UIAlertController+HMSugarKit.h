//
//  UIAlertController+HMSugarKit.h
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/11/19.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (HMSugarKit)

-(void)sk_addActionWithTitle:(NSString*)title style:(UIAlertActionStyle)style prepare:(void (^)(UIAlertAction* action))prepareBlock action:(void (^)(UIAlertAction* action))actionBlock;
-(void)sk_addCancelAction;
-(void)sk_addCancelActionWithBlock:(void (^)(UIAlertAction* action))block;

@end
