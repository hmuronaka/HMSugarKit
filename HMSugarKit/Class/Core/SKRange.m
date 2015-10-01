//
//  SKRange.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/09/30.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "SKRange.h"

@implementation SKRange

-(BOOL)include:(id _Nonnull)value {
    if( self.begin == nil || self.end == nil ) {
        return nil;
    }
    
    [self.begin performSelector:@selector(compare:) withObject:value];
    
}
@end
