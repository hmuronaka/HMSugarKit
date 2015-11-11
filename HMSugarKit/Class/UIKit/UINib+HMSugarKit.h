//
//  UINib+HMSugarKit.h
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/11/11.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (HMSugarKit)

+(instancetype)sk_loadWithNibName:(NSString*)nibName bundle:(NSBundle*)bundleOrNil path:(NSString*)path;
+(instancetype)sk_loadDynamicallyWithNibName:(NSString*)nibName bundle:(NSBundle *)bundleOrNil path:(NSString*)path;

@end
