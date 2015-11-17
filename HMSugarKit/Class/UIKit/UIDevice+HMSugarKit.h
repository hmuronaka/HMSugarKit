//
//  UIDevice+HMSugarKit.h
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/11/11.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (HMSugarKit)

-(BOOL)sk_isIPad;
-(NSInteger)sk_majorVersion;
-(NSComparisonResult)sk_compareOSMajorVersion:(NSInteger)majorVersion;
-(BOOL)sk_greaterThanOrEqualToIOS7;

@end
