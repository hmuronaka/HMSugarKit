//
//  SKStep.h
//  SKSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/08.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKStep : NSObject

@property(nonatomic, assign) double step;

-(instancetype)initWithStep:(double)step;
-(double)sk_snap:(double)value;

@end
