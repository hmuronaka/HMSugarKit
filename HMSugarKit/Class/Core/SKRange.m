//
//  SKRange.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/09/30.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "SKRange.h"

@implementation SKRange

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark init

-(instancetype)initWithBegin:(id)begin end:(id)end {
    self = [super init];
    if( self ) {
        self.begin = begin;
        self.end = end;
    }
    return self;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark check

-(BOOL)sk_include:(id _Nonnull)value {
    if( self.begin == nil || self.end == nil ) {
        return nil;
    }
    return [[self class] sk_includeWithBegin:self.begin end:self.end value:value];
}

-(BOOL)sk_exclude:(id _Nonnull)value {
    return ![self sk_include:value];
}

+(BOOL)sk_includeWithBegin:(id _Nonnull)begin end:(id _Nonnull)end value:(id _Nonnull)value {
    NSComparisonResult beginResult = [self pr_src:begin compare:value];
    NSComparisonResult endResult = [self pr_src:end compare:value];
    return beginResult != NSOrderedDescending && endResult != NSOrderedAscending;
}

+(BOOL)sk_excludeWithBegin:(id _Nonnull)begin end:(id _Nonnull)end value:(id _Nonnull)value {
    return ![self sk_includeWithBegin:begin end:end value:value];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark private

+(NSComparisonResult)pr_src:(id _Nonnull)src compare:(id _Nonnull)other {
    NSMethodSignature* methodSignature = [src methodSignatureForSelector:@selector(compare:)];
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    [invocation setSelector:@selector(compare:)];
    [invocation setTarget:src];
    [invocation setArgument:&other atIndex:2];
    [invocation invoke];
    
    NSComparisonResult result = 0;
    [invocation getReturnValue:&result];
    return result;
}

@end
