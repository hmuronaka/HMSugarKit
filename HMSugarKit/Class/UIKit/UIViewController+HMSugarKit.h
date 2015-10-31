//
//  UIViewController+HMSugarKit.h
//  CutAndLoop
//
//  Created by Muronaka Hiroaki on 2015/10/12.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HMSugarKit)

+(instancetype)sk_createFromNib;

-(void)sk_showMessageWithTitle:(NSString*)title message:(NSString*)message;
-(void)sk_showErrorMessage:(NSString*)message;

@end
