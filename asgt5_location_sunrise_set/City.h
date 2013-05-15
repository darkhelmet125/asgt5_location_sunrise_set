//
//  City.h
//  asgt5_location_sunrise_set
//
//  Created by William Short on 5/7/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface City : NSObject

@property (nonatomic, retain) NSString* city;
@property (nonatomic, retain) NSString* state;
@property (nonatomic, retain) NSString* timezone;
@property (readonly) CLLocationCoordinate2D coord;
@property (readonly) float longitudeString;
@property (readonly) float latitudeString;

- (id) initWithCity: (NSString*) theCity andState: (NSString*) theState andTimezone: (NSString*) theTimezone andCoordinate: (CLLocationCoordinate2D) theCoordinate;

- (NSString*) stringForLongitude;

- (NSString*) stringForLatitude;

@end
