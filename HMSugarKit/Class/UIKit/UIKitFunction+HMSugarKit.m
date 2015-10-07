//
//  UIKitFunction+HMSugarKit.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/07.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UIKitFunction+HMSugarKit.h"

#pragma mark
#pragma CGize

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