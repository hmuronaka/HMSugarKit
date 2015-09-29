//
//  NSArray+HMSugarKit.h
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/09/29.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HMSugarKit)

typedef id _Nonnull (^SK_IDBlock)(id _Nonnull value);

-(id _Nonnull)sk_shift;
-(id _Nonnull)sk_pop;
-(NSArray* _Nonnull)sk_merge:(NSArray* _Nullable)other;
-(NSArray* _Nonnull)sk_map:(SK_IDBlock _Nullable)block;

@end
