//
//  NSArray+HMSugarKit.h
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/09/29.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMSugarKitCommon.h"

@interface NSArray (HMSugarKit)

typedef id _Nonnull (^SK_IDBlock)(id _Nonnull value, HMSugarKitBlockStatus* _Nonnull blockStatus);
typedef BOOL (^SK_PredicateBlock)(id _Nonnull value);

-(NSArray* _Nonnull)sk_merge:(NSArray* _Nullable)other;
-(NSArray* _Nonnull)sk_map:(SK_IDBlock _Nullable)block;

-(id _Nullable)sk_find:(SK_PredicateBlock _Nullable)block;
-(id _Nullable)sk_findFromIndex:(NSInteger)index block:(SK_PredicateBlock _Nullable)block;
-(NSInteger)sk_indexWithBlock:(SK_PredicateBlock _Nullable)block;
-(NSInteger)sk_indexFromBegin:(NSInteger)begin block:(SK_PredicateBlock _Nullable)block;

-(id _Nullable)sk_reverseFind:(SK_PredicateBlock _Nullable)block;
-(id _Nullable)sk_reverseFindFromIndex:(NSInteger)index block:(SK_PredicateBlock _Nullable)block;
-(id _Nullable)sk_reverseIndexWithBlock:(SK_PredicateBlock _Nullable)block;

-(NSArray* _Nonnull)sk_keepIf:(SK_PredicateBlock _Nullable)block;
-(NSArray* _Nonnull)sk_removeIf:(SK_PredicateBlock _Nullable)block;

-(BOOL)sk_any:(SK_PredicateBlock _Nullable)block;
-(BOOL)sk_all:(SK_PredicateBlock _Nullable)block;
-(BOOL)sk_none:(SK_PredicateBlock _Nullable)block;


@end
