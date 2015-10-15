//
//  LongitudeLatitude.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/14.
//  Copyright © 2015年 hmuronaka. All rights reserved.
//

#import "CLLocation+HMSugarKit.h"
#import "GetDistanceHubeny.h"

@implementation CLLocation (HMSugarKit)

-(double)longitude {
    return self.coordinate.longitude;
}

-(double)latitude {
    return self.coordinate.latitude;
}

-(double)distance:(CLLocation*)other {
    return getDistanceHubeny(self.longitude, self.latitude, other.longitude, other.latitude);
}

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MapKit

#ifdef USE_MAP_KIT

-(MKCoordinateRegion)toRegionWithLatitudeMeters:(CLLocationDistance)latitudinalMeters longitudeMeters:(CLLocationDistance)longitudinalMeters {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.coordinate, latitudinalMeters, longitudinalMeters);
    return region;
}

#endif






@end
