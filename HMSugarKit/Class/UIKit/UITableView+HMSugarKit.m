//
//  UITableView+HMSugarKit.m
//  PurchaseSample
//
//  Created by MuronakaHiroaki on 2015/10/05.
//  Copyright © 2015年 hmu. All rights reserved.
//

#import "UITableView+HMSugarKit.h"

@implementation UITableView (HMSugarKit)

-(NSIndexPath*)sk_indexPathFromTouchEvent:(UIEvent*)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint p = [touch locationInView:self];
    NSIndexPath *indexPath = [self indexPathForRowAtPoint:p];
    return indexPath;
}

@end
