//
//  UIKitFunction+HMSugarKit.h
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/07.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//
#import <UIKit/UIKit.h>

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark CGSize

void sk_CGSizeSetStringDefaultFormat(NSString* format);
CGSize sk_CGSizeSwap(CGSize size);
CGSize sk_CGSizeMultiply(CGSize size1, CGSize size2);
CGSize sk_CGSizeMultiplyValue(CGSize size, CGFloat rate);
CGSize sk_CGSizeMultiplyValues(CGSize size, CGFloat width, CGFloat height);
CGSize sk_CGSizeAddValues(CGSize size, CGFloat width, CGFloat height);
CGSize sk_CGSizeAdd(CGSize size1, CGSize size2);
NSString* sk_CGSizeString(CGSize size);

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark CGPoint

void sk_CGPointSetStringDefaultFormat(NSString* format);
CGPoint sk_CGPointSwap(CGPoint point);
CGPoint sk_CGPointMultiply(CGPoint point1, CGPoint point2);
CGPoint sk_CGPointMultiplyValue(CGPoint point, CGFloat rate);
CGPoint sk_CGPointMultiplyValues(CGPoint point, CGFloat width, CGFloat height);
CGPoint sk_CGPointAddValues(CGPoint point, CGFloat width, CGFloat height);
CGPoint sk_CGPointAdd(CGPoint point1, CGPoint point2);
NSString* sk_CGPointString(CGPoint point);

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark CGRect

CGRect sk_CGRectMakeFromOriginSize(CGPoint origin, CGSize size);

// Diagonal:対角
CGRect sk_CGRectMakeFromDiagonal(CGPoint point1, CGPoint point2);
CGRect sk_CGRectMakeFromLines(NSArray* points);
