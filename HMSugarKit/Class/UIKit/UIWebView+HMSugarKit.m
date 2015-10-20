//
//  UIWebView+HMSugarKit.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/20.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UIWebView+HMSugarKit.h"

@implementation UIWebView (HMSugarKit)

-(NSURLRequest*)sk_loadRequestWithURLString:(NSString*)urlStr block:(void (^)(NSURLRequest* request))block {
    
    NSURL* url = [NSURL URLWithString:urlStr];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    if( block ) {
        block(request);
    }
    
    [self loadRequest:request];
    return request;
}


@end
