//
//  NSArray+HMSugarKit.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/09/29.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "NSArray+HMSugarKit.h"

@implementation NSArray (HMSugarKit)

-(id _Nullable)sk_find:(SK_PredicateBlock _Nullable)block {
    if( !block ) {
        return nil;
    }
    __block id result = nil;
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if( block( obj ) ) {
            result = obj;
            *stop = YES;
        }
    }];
    return result;
}

@end
