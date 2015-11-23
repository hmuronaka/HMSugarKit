//
//  UIViewController+HMSugarKit.m
//  CutAndLoop
//
//  Created by Muronaka Hiroaki on 2015/10/12.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UIViewController+HMSugarKit.h"

@implementation UIViewController (HMSugarKit)

+(instancetype)sk_createFromNib {
    NSString* className = NSStringFromClass(self);
    return [[NSClassFromString(className) alloc] initWithNibName:className bundle:nil];
}

+(instancetype)sk_topViewController {
    return [UIApplication sharedApplication].keyWindow.rootViewController;
}

-(void)sk_showErrorMessage:(NSString*)message {
    [self sk_showMessageWithTitle:@"Error" message:message];
}

-(void)sk_showMessageWithTitle:(NSString*)title message:(NSString*)message {
    
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}




@end
