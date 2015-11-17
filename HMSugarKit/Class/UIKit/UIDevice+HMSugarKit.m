//
//  UIDevice+HMSugarKit.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/11/11.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UIDevice+HMSugarKit.h"

@implementation UIDevice (HMSugarKit)

-(BOOL)sk_isIPad {
    NSString* model = [UIDevice currentDevice].model;
    return [model hasPrefix:@"iPad"];
}

-(NSInteger)sk_majorVersion {
    NSArray  *osVersions = [self.systemVersion componentsSeparatedByString:@"."];
    return [osVersions[0] integerValue];
}

-(NSComparisonResult)sk_compareOSMajorVersion:(NSInteger)majorVersion {
    NSInteger result = [self sk_majorVersion] - majorVersion;
    return (result == 0 ? NSOrderedSame : (
                                           result < 0 ? NSOrderedAscending : NSOrderedDescending
                                           ));
}

-(BOOL)sk_greaterThanOrEqualToIOS7 {
    return [self sk_compareOSMajorVersion:7] != NSOrderedAscending;
}

@end
