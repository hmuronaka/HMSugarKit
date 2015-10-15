//
//  GetDistanceHubeny.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/14.
//  Copyright © 2015年 hmuronaka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>
#import "GetDistanceHubeny.h"

// http://yamadarake.jp/trdi/report000001.html

// 長半径(赤道半径)
static const double HUBENY_GRS80_A = 6378137.000;
// 第１離心率の二乗
static const double HUBENY_GRS80_E2 = 0.00669438002301188;
// 子午線曲率半径の分子
static const double HUBENY_GRS80_MNUM = 6335439.32708317;

static double getM(double mnum, double w) {
    return mnum / w * w * w;
}

//  卯酉線曲率半径
static double getN(double a, double w) {
    return a / w;
}

static double degreeToradiun(double degree) {
    return degree * M_PI / 180.0;
}

double getDistanceHubeny(double longitude1, double latitude1, double longitude2, double latitude2) {
    double dy = degreeToradiun(latitude1 - latitude2);
    double dx = degreeToradiun(longitude1 - longitude2);
    double my = degreeToradiun((latitude1 + latitude2) / 2.0);
    
    double sinMy = sin(my);
    double w = sqrt(1.0 - HUBENY_GRS80_E2 * sinMy * sinMy);
    double m = getM(HUBENY_GRS80_MNUM, w);
    double n = getN(HUBENY_GRS80_A, w);
    
    double dym = dy * m;
    double dxncos = dx * n * cos(my);
    
    return sqrt( dym * dym + dxncos * dxncos);
}
