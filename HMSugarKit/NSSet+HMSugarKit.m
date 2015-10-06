//
//  NSSet+HMSugarKit.m
//  PurchaseSample
//
//  Created by MuronakaHiroaki on 2015/10/05.
//  Copyright © 2015年 hmu. All rights reserved.
//

#import "NSSet+HMSugarKit.h"

@implementation NSSet (HMSugarKit)

-(NSSet* _Nonnull)sk_addObject:(id _Nullable)obj {
    if( !obj ) {
        return self;
    }
    
    NSMutableSet* result = [NSMutableSet setWithSet:self];
    [result addObject:obj];
    return [result copy];
}

@end
