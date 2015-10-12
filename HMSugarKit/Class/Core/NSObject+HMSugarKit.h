//
//  NSObject+HMSugarKit.h
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/06.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SKObjectBlock)();
typedef void (^SKObjectCancelBlock)(BOOL cancel);

@interface NSObject (HMSugarKit)

-(SKObjectCancelBlock)sk_performBlockOnMainThread:(SKObjectBlock)block;
-(NSString*)sk_className;

@end
