//
//  MKMapView+HMSugarKit.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/15.
//  Copyright © 2015年 hmuronaka. All rights reserved.
//

#import "MKMapView+HMSugarKit.h"

@implementation MKMapView (HMSugarKit)

-(void)sk_removeAllAnnotations {
    [self removeAnnotations:self.annotations];
}

@end
