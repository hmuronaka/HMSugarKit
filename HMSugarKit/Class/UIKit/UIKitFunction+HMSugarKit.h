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

CGSize sk_CGSizeSwap(CGSize size);
CGSize sk_CGSizeMultiply(CGSize size1, CGSize size2);
CGSize sk_CGSizeMultiplyValue(CGSize size, CGFloat rate);
CGSize sk_CGSizeMultiplyValues(CGSize size, CGFloat width, CGFloat height);
CGSize sk_CGSizeAddValues(CGSize size, CGFloat width, CGFloat height);
CGSize sk_CGSizeAdd(CGSize size1, CGSize size2);