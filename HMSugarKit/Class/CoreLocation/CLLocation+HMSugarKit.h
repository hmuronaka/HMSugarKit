//
//  LongitudeLatitude.h
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/14.
//  Copyright © 2015年 hmuronaka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#if __has_include(<MapKit/MapKit.h>)
#define USE_MAP_KIT
#import <MapKit/MapKit.h>
#endif

@interface CLLocation(HMSugarKit)

-(double)sk_latitude;
-(double)sk_longitude;
-(double)sk_distance:(CLLocation*)other;
+(CLLocation*)sk_locationFromCLLocationCoordinate2D:(CLLocationCoordinate2D)coordinate2D;

#ifdef USE_MAP_KIT
-(MKCoordinateRegion)sk_toRegionWithLatitudeMeters:(CLLocationDistance)latitudinalMeters longitudeMeters:(CLLocationDistance)longitudinalMeters;
#endif

@end
