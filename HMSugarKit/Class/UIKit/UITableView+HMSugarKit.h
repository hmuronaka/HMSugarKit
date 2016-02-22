//
//  UITableView+HMSugarKit.h
//  PurchaseSample
//
//  Created by MuronakaHiroaki on 2015/10/05.
//  Copyright © 2015年 hmu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (HMSugarKit)

-(NSIndexPath*)sk_indexPathFromTouchEvent:(UIEvent*)event;
-(void)sk_reloadDataWithCompetion:(void (^)(UITableView* tableView))block;

@end
