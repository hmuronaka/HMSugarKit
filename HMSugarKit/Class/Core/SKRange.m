//
//  SKRange.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/09/30.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "SKRange.h"

@implementation SKRange

-(BOOL)include:(id _Nonnull)value {
    if( self.begin == nil || self.end == nil ) {
        return nil;
    }
    
    NSComparisonResult beginResult = [self src:self.begin compare:value];
    NSComparisonResult endResult = [self src:self.end compare:value];
    
    return beginResult != NSOrderedDescending && endResult != NSOrderedAscending;
}

-(NSComparisonResult)src:(id _Nonnull)src compare:(id _Nonnull)other {
    NSMethodSignature* methodSignature = [src methodSignatureForSelector:@selector(compare:)];
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    [invocation setSelector:@selector(compare:)];
    [invocation setTarget:src];
    [invocation setArgument:&other atIndex:0];
    
    
    
}

@end
