//
//  UIWebView+HMSugarKit.h
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/20.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (HMSugarKit)

-(NSURLRequest*)sk_loadRequestWithURLString:(NSString*)urlStr block:(void (^)(NSURLRequest* request))block;

@end
