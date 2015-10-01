//
//  SKRange.h
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/09/30.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKRange : NSObject

@property(nonatomic, strong) id _Nonnull begin;
@property(nonatomic, strong) id _Nonnull end;

-(instancetype _Nullable)initWithBegin:(id _Nonnull)begin end:(id _Nonnull)end;

// begin <= value <= end
-(BOOL)include:(id _Nonnull)value;
-(BOOL)exclude:(id _Nonnull)value;

@end
