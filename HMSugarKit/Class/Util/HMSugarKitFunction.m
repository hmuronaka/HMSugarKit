//
//  HMSugarKitLib.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/14.
//  Copyright © 2015年 hmuronaka. All rights reserved.
//

#import <Foundation/Foundation.h>

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