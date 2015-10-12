//
//  NSObject+HMSugarKit.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/06.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "NSObject+HMSugarKit.h"

@implementation NSObject (HMSugarKit)

-(SKObjectCancelBlock)sk_performBlockOnMainThread:(SKObjectBlock)block {
    if( !block ) {
        return nil;
    }
    
    __block BOOL canceled = NO;
    SKObjectCancelBlock cancelBlock = ^(BOOL cancel) {
        if( cancel ) {
            canceled = cancel;
            return;
        }
        
        if( !canceled ) {
            block();
        }
    };
    
    if( [NSThread isMainThread] ) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            cancelBlock(NO);
        });
    }
    return cancelBlock;
}

-(NSString*)sk_className {
    return NSStringFromClass([self class]);
}

@end
