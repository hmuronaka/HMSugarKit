//
//  NSArray+HMSugarKit.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/09/29.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "NSArray+HMSugarKit.h"

@implementation NSArray (HMSugarKit)

-(NSArray* _Nonnull)sk_merge:(NSArray* _Nullable)other {
    if( other ) {
        return [self arrayByAddingObjectsFromArray:other];
    }
    return self;
}

-(NSArray* _Nonnull)sk_map:(SK_IDBlock _Nullable)block {
    if( !block ) {
        return self;
    }
    
    NSMutableArray* result = [[NSMutableArray alloc] initWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HMSugarKitBlockStatus blockStatus = HMSugarKitBlockStatusNone;
        id blockResult = block(obj, &blockStatus);
        if( blockStatus == HMSugarKitBlockStatusContinue ) {
            ;
        } else if( blockStatus == HMSugarKitBlockStatusBreak ) {
            *stop = YES;
        } else {
            [result addObject:blockResult];
        }
    }];
    
    return [result copy];
}


-(id _Nullable)sk_find:(SK_PredicateBlock _Nullable)block {
    if( !block ) {
        return nil;
    }
    
    __block id result;
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if( block(obj) ) {
            result = obj;
            *stop = YES;
        }
    }];
    return result;
}

-(id _Nullable)sk_findFromIndex:(NSInteger)index block:(SK_PredicateBlock)block {
    if( !block ) {
        return nil;
    }
    
    __block id result;
    for(NSUInteger i = 0; i < self.count; i++) {
        if( block (self[i]) ) {
            result = self[i];
            break;
        }
    }
    return result;
}

-(id _Nullable)sk_reverseFindFromIndex:(NSInteger)index block:(SK_PredicateBlock _Nullable)block {
    return nil;
}
  
-(NSArray* _Nonnull)sk_keepIf:(SK_PredicateBlock _Nullable)block {
    if( !block ) {
        return self;
    }
    
    NSMutableArray* result = [NSMutableArray new];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if( block(obj) ) {
            [result addObject:result];
        }
    }];
    
    return [result copy];
}

//-(NSArray* _Nonnull)sk_removeIf:(SK_PredicateBlock _Nullable)block;

//-(BOOL)sk_any:(SK_PredicateBlock _Nullable)block;
//-(BOOL)sk_all:(SK_PredicateBlock _Nullable)block;
//-(BOOL)sk_none:(SK_PredicateBlock _Nullable)block;
//
//
//-(id _Nullable)sk_find:(SK_PredicateBlock _Nullable)block {
//    if( !block ) {
//        return nil;
//    }
//    __block id result = nil;
//    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if( block( obj ) ) {
//            result = obj;
//            *stop = YES;
//        }
//    }];
//    return result;
//}

@end
