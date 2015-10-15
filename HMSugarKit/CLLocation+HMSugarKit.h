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

-(double)latitude;
-(double)longitude;
-(double)distance:(CLLocation*)other;

#ifdef USE_MAP_KIT
-(MKCoordinateRegion)toRegionWithLatitudeMeters:(CLLocationDistance)latitudinalMeters longitudeMeters:(CLLocationDistance)longitudinalMeters;
#endif

@end
