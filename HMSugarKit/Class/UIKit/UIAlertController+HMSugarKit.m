//
//  UIAlertController+HMSugarKit.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/11/19.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UIAlertController+HMSugarKit.h"

@implementation UIAlertController (HMSugarKit)

-(void)sk_addActionWithTitle:(NSString*)title style:(UIAlertActionStyle)style prepare:(void (^)(UIAlertAction* action))prepareBlock action:(void (^)(UIAlertAction* action))actionBlock {
    
    UIAlertAction* action = [UIAlertAction actionWithTitle:title style:style handler:actionBlock];
    
    if(prepareBlock) {
        prepareBlock( action );
    }
    
    [self addAction:action];
}

-(void)sk_addCancelAction {
    
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [self addAction:action];
    
}

-(void)sk_addCancelActionWithBlock:(void (^)(UIAlertAction* action))block {
    
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:block];
    [self addAction:action];
    
}


@end
