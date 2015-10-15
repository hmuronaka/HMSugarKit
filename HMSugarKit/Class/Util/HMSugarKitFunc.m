//
//  HMSugarKitLib.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/14.
//  Copyright © 2015年 hmuronaka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMSugarKitFunc.h"

NSComparisonResult sk_compareDouble(double v1, double v2) {
    
    double result = v1 - v2;
    
    if( result == 0 ) {
        return NSOrderedSame;
    }
    
    return (v1 < v2) ? NSOrderedAscending : NSOrderedDescending;
}

BOOL sk_lessDouble(double v1, double v2) {
    return v1 < v2;
}

BOOL sk_lessOrEqualDouble(double v1, double v2) {
    return v1 <= v2;
}

BOOL sk_equalDouble(double v1, double v2) {
    return v1 == v2;
}

BOOL sk_greaterOrEqualDouble(double v1, double v2) {
    return v1 >= v2;
}

BOOL sk_greaterDouble(double v1, double v2) {
    return v1 > v2;
}

BOOL sk_equalDoubleAccuracy(double v1, double v2, double epsilon) {
    return fabs(v1 - v2) < epsilon;
}

BOOL sk_equalLocationCoordinate2D(CLLocationCoordinate2D v1, CLLocationCoordinate2D v2) {
    return sk_equalDoubleAccuracy(v1.latitude, v2.latitude, DBL_EPSILON) &&
           sk_equalDoubleAccuracy(v1.longitude, v2.longitude, DBL_EPSILON);
}