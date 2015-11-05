//
//  NSURL+HMSugarKit.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/14.
//  Copyright © 2015年 hmuronaka. All rights reserved.
//

#import "NSURL+HMSugarKit.h"

@implementation NSURL (HMSugarKit)

+(instancetype)sk_URLWithTelNumber:(NSString*)telephoneNumber {
    
    if( ![telephoneNumber hasPrefix:@"tel:"] ) {
        telephoneNumber = [NSString stringWithFormat:@"tel:%@",telephoneNumber];
    }
    
    NSURL* url = [NSURL URLWithString:telephoneNumber];
    return url;
}

@end
