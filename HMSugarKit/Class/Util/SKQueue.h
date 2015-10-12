//
//  SKQueue.h
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/10/11.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKQueue : NSObject

@property(nonatomic, readonly) NSInteger maxSize;
@property(nonatomic, readonly) NSInteger nowSize;
@property(nonatomic, readonly) BOOL isEmpty;
@property(nonatomic, readonly) BOOL isFull;

-(id)initWithMaxSize:(NSInteger)maxSize;
-(id)deque;
// nilを追加することはできない.
-(BOOL)enque:(id)obj;
-(void)clear;

@end
