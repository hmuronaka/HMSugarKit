//
//  UIKitFunction+HMSugarKit.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/07.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <BlocksKit/NSArray+BlocksKit.h>
#import "UIKitFunction+HMSugarKit.h"

static NSString* SK_CGSizeDefaultStringFormat = @"(W=%f, H=%f)";
static NSString* SK_CGPointDefaultStringFormat = @"(X=%f, Y=%f)";

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark
#pragma CGize

void sk_CGSizeSetStringDefaultFormat(NSString* format) {
    SK_CGSizeDefaultStringFormat = format;
}

CGSize sk_CGSizeSwap(CGSize size) {
    return CGSizeMake(size.height, size.width);
}

CGSize sk_CGSizeMultiply(CGSize size1, CGSize size2) {
    return sk_CGSizeMultiplyValues(size1, size2.width, size2.height);
}

CGSize sk_CGSizeMultiplyValue(CGSize size, CGFloat rate) {
    return sk_CGSizeMultiplyValues(size, rate, rate);
}

CGSize sk_CGSizeMultiplyValues(CGSize size, CGFloat width, CGFloat height) {
    return CGSizeMake(size.width * width, size.height * height);
}

CGSize sk_CGSizeAdd(CGSize size1, CGSize size2) {
    return sk_CGSizeAddValues(size1, size2.width, size2.height);
}

CGSize sk_CGSizeAddValues(CGSize size, CGFloat width, CGFloat height) {
    return CGSizeMake(size.width + width, size.height + height);
}

NSString* sk_CGSizeString(CGSize size) {
    return [NSString stringWithFormat:SK_CGSizeDefaultStringFormat, size.width, size.height];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark CGPoint

void sk_CGPointSetStringDefaultFormat(NSString* format) {
    SK_CGPointDefaultStringFormat = format;
}

CGPoint sk_CGPointSwap(CGPoint point) {
    return CGPointMake(point.y, point.x);
}

CGPoint sk_CGPointMultiply(CGPoint point1, CGPoint point2) {
    return sk_CGPointMultiplyValues(point1, point2.x, point2.y);
}

CGPoint sk_CGPointMultiplyValue(CGPoint point, CGFloat rate) {
    return sk_CGPointMultiplyValues(point, rate, rate);
}

CGPoint sk_CGPointMultiplyValues(CGPoint point, CGFloat x, CGFloat y) {
    return CGPointMake(point.x * x, point.y * y);
}

CGPoint sk_CGPointAdd(CGPoint point1, CGPoint point2) {
    return sk_CGPointAddValues(point1, point2.x, point2.y);
}

CGPoint sk_CGPointAddValues(CGPoint point, CGFloat x, CGFloat y) {
    return CGPointMake(point.x + x, point.y + y);
}

NSString* sk_CGPointString(CGPoint point) {
    return [NSString stringWithFormat:SK_CGPointDefaultStringFormat, point.x, point.y];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark CGRect

CGRect sk_CGRectMakeFromOriginSize(CGPoint origin, CGSize size) {
    return CGRectMake(origin.x, origin.y, size.width, size.height);
}

CGRect sk_CGRectMakeFromDiagonal(CGPoint point1, CGPoint point2) {
    
    CGFloat x = MIN(point1.x, point2.x);
    CGFloat y = MIN(point1.y, point2.y);
    CGFloat width = MAX(point1.x, point2.x) - x;
    CGFloat height = MAX(point1.y, point2.y) - y;
    CGRect rect = CGRectMake(x, y, width, height);
    
    return rect;
}

CGRect sk_CGRectMakeFromLines(NSArray* points) {
    
    CGPoint first = [points.firstObject CGPointValue];
    CGFloat minX = [points bk_reduceFloat:first.x withBlock:^CGFloat(CGFloat result, id obj) {
        CGPoint other = [obj CGPointValue];
        return MIN(result, other.x);
    }];
    CGFloat minY = [points bk_reduceFloat:first.y withBlock:^CGFloat(CGFloat result, id obj) {
        CGPoint other = [obj CGPointValue];
        return MIN(result, other.y);
    }];
    CGFloat maxX = [points bk_reduceFloat:first.x withBlock:^CGFloat(CGFloat result, id obj) {
        CGPoint other = [obj CGPointValue];
        return MAX(result, other.x);
    }];
    CGFloat maxY = [points bk_reduceFloat:first.y withBlock:^CGFloat(CGFloat result, id obj) {
        CGPoint other = [obj CGPointValue];
        return MAX(result, other.y);
    }];
    
    CGRect rect = CGRectMake(minX, minY, maxX - minX, maxY - minY);
    return rect;
}