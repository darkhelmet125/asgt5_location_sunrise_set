//
//  City.m
//  asgt5_location_sunrise_set
//
//  Created by William Short on 5/7/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import "City.h"

@implementation City

@synthesize city;
@synthesize state;
@synthesize timezone;
@synthesize coord;
@synthesize latitudeString;
@synthesize longitudeString;

- (id) initWithCity: (NSString*) theCity andState: (NSString*) theState andTimezone: (NSString*) theTimezone andCoordinate: (CLLocationCoordinate2D) theCoordinate
{
    self = [super init];
    if(self)
    {
        city = theCity;
        state = theState;
        timezone = theTimezone;
        coord = CLLocationCoordinate2DMake(theCoordinate.latitude, theCoordinate.longitude);
    }
    return self;
}

- (NSString*) stringForLongitude
{
    double theta = coord.longitude;
    double deg = floor(theta);
    double min = floor((theta - deg) * 60.0);
    double sec = floor((theta - deg - (min/60.0)) * 3600.0);
    return [NSString stringWithFormat: @"%g° %g' %g\"", deg, min, sec];
}

- (NSString*) stringForLatitude
{
    double theta = coord.latitude;
    double deg = floor(theta);
    double min = floor((theta - deg) * 60.0);
    double sec = floor((theta - deg - (min/60.0)) * 3600.0);
    return [NSString stringWithFormat: @"%g° %g' %g\"", deg, min, sec];
}

@end
