//
//  NSOrderedSet+HMSugarKit.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/10/20.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "NSOrderedSet+HMSugarKit.h"

@implementation NSOrderedSet (HMSugarKit)

-(NSOrderedSet*)sk_orderedSetExchangeFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    
    NSMutableOrderedSet* orderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:self];
    [orderedSet exchangeObjectAtIndex:fromIndex withObjectAtIndex:toIndex];
    return [orderedSet copy];
}

@end
