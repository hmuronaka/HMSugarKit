//
//  NSDictionary+HMSugarKit.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/09/29.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "NSDictionary+HMSugarKit.h"

@implementation NSDictionary (HMSugarKit)

#pragma mark merge

-(NSDictionary* _Nonnull )sk_mergeDictionary:(NSDictionary* _Nullable )dictionary {
    NSMutableDictionary* result = [NSMutableDictionary dictionaryWithDictionary:self];
    [result addEntriesFromDictionary:dictionary];
    return [result copy];
}

#pragma mark keep

-(NSDictionary* _Nonnull )sk_keepFromKeys:(NSArray* _Nullable)keys {
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    if( !keys ) {
        return self;
    }
    
    [keys enumerateObjectsUsingBlock:^(id  _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        if( self[key] ) {
            [result setObject:self[key] forKey:key];
        }
    }];
    
    return [result copy];
}

-(NSDictionary* _Nonnull )sk_keepIf:(SK_Predicate2Block _Nullable)block {
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    if( !block ) {
        return self;
    }
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if( block(key, obj) ) {
            [result setObject:obj forKey:key];
        }
    }];
    
    return [result copy];
}

#pragma mark remove

-(NSDictionary* _Nonnull)sk_removeFromKeys:(NSArray *)keys {
    NSMutableDictionary* result = [NSMutableDictionary dictionaryWithDictionary:self];
    
    [keys enumerateObjectsUsingBlock:^(id  _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        if( result[key] ) {
            [result removeObjectForKey:key];
        }
    }];
    
    return [result copy];
}

-(NSDictionary* _Nonnull)sk_removeIf:(SK_Predicate2Block _Nullable)block {
    NSMutableDictionary* result = [NSMutableDictionary dictionaryWithDictionary:self];
    
    if( !block ) {
        return self;
    }
    
    NSArray* keys = result.allKeys;
    
    [keys enumerateObjectsUsingBlock:^(id  _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        if( block(key, result[key])) {
            [result removeObjectForKey:key];
        }
    }];
    
    return [result copy];
}

#pragma mark bool

-(BOOL)sk_isEmpty {
    return self.count == 0;
}

#pragma mark fetch

-(id _Nullable )sk_fetchWithKey:(id _Nonnull)key defaultValue:(id _Nullable)defaultValue {
    
    id result = self[key];
    if( !result ) {
        result = defaultValue;
    }
    return result;
}

-(id _Nullable )sk_fetchWithKey:(id _Nonnull)key defaultBlock:(SK_DefaultBlock _Nullable )block {
    
    id result = self[key];
    if( !result && block ) {
        result = block(key);
    }
    
    return result;
}

#pragma mark invert

-(NSDictionary* _Nonnull )invert {
    
    NSMutableDictionary* result = [NSMutableDictionary new];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        result[obj] = key;
    }];
    
    return [result copy];
}

@end
