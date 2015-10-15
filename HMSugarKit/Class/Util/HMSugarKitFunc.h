//
//  HMSugarKitLib.h
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/14.
//  Copyright © 2015年 hmuronaka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NSComparisonResult sk_compareDouble(double v1, double v2);

typedef BOOL (*sk_comparatorDouble)(double v1, double v2);

BOOL sk_lessDouble(double v1, double v2);
BOOL sk_lessOrEqualDouble(double v1, double v2);
BOOL sk_equalDouble(double v1, double v2);
BOOL sk_greaterOrEqualDouble(double v1, double v2);
BOOL sk_greaterDouble(double v1, double v2);

BOOL sk_equalDoubleAccuracy(double v1, double v2, double epsilon);
BOOL sk_equalLocationCoordinate2D(CLLocationCoordinate2D v1, CLLocationCoordinate2D v2);

