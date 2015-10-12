//
//  SKQueue.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/10/11.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "SKQueue.h"


@interface SKQueue()

@property(nonatomic, assign) NSInteger readIndex;
@property(nonatomic, assign) NSInteger writeIndex;
@property(nonatomic, strong) NSMutableArray* buffer;

@end

@implementation SKQueue

-(id)initWithMaxSize:(NSInteger)maxSize
{
    self = [super init];
    if( self != nil ) {
        _nowSize = 0;
        _maxSize = maxSize;
        self.readIndex = 0;
        self.writeIndex = 0;
        self.buffer = [[NSMutableArray alloc] initWithCapacity:self.maxSize];
    }
    return self;
}

-(BOOL)enque:(id)obj
{
    if( [self isFull] ) {
        return NO;
    }
    self.buffer[self.writeIndex] = obj;
    _nowSize++;
    self.writeIndex = [self nextIndex:self.writeIndex];
    return YES;
}

-(id)deque
{
    if( [self isEmpty] ) {
        return nil;
    }
    id result = self.buffer[self.readIndex];
    self.buffer[self.readIndex] = [NSNull null];
    _nowSize--;
    self.readIndex = [self nextIndex:self.readIndex];
    return result;
}

-(void)clear {
    [self.buffer removeAllObjects];
    _nowSize = 0;
    self.readIndex = 0;
    self.writeIndex = 0;
}


-(NSInteger)nextIndex:(NSInteger)index {
    return (index + 1) % self.maxSize;
}

-(BOOL)isFull
{
    return (self.maxSize == self.nowSize);
}

-(BOOL)isEmpty
{
    return self.nowSize == 0;
}

@end
