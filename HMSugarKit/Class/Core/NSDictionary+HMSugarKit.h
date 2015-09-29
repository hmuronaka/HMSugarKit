//
//  NSDictionary+HMSugarKit.h
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/09/29.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id _Nullable (^SK_DefaultBlock)(id _Nonnull key);
typedef BOOL (^SK_Predicate2Block)(id _Nonnull key, id _Nonnull value);

@interface NSDictionary (HMSugarKit)

-(NSDictionary* _Nonnull )sk_mergeDictionary:(NSDictionary* _Nullable )dictionary;
-(NSDictionary* _Nonnull )sk_keepFromKeys:(NSArray* _Nullable)keys;
-(NSDictionary* _Nonnull )sk_keepIf:(SK_Predicate2Block _Nullable )block;
-(NSDictionary* _Nonnull )sk_removeFromKeys:(NSArray* _Nullable )keys;
-(NSDictionary* _Nonnull )sk_removeIf:(SK_Predicate2Block _Nullable )block;
-(BOOL)sk_isEmpty;
-(id _Nullable )sk_fetchWithKey:(id _Nonnull)key defaultValue:(id _Nullable)defaultValue;
-(id _Nullable )sk_fetchWithKey:(id _Nonnull)key defaultBlock:(SK_DefaultBlock _Nullable)block;
-(NSDictionary* _Nonnull )invert;


@end
