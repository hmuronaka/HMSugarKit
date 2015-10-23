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

-(double)sk_longitude {
    return self.coordinate.longitude;
}

-(double)sk_latitude {
    return self.coordinate.latitude;
}

-(double)sk_distance:(CLLocation*)other {
    return getDistanceHubeny(self.sk_longitude, self.sk_latitude, other.sk_longitude, other.sk_latitude);
}


+(CLLocation*)sk_locationFromCLLocationCoordinate2D:(CLLocationCoordinate2D)coordinate2D {
    CLLocation* location = [[CLLocation alloc] initWithLatitude:coordinate2D.latitude longitude:coordinate2D.longitude];
    return location;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MapKit

#ifdef USE_MAP_KIT

-(MKCoordinateRegion)sk_toRegionWithLatitudeMeters:(CLLocationDistance)latitudinalMeters longitudeMeters:(CLLocationDistance)longitudinalMeters {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.coordinate, latitudinalMeters, longitudinalMeters);
    return region;
}

#endif






@end
