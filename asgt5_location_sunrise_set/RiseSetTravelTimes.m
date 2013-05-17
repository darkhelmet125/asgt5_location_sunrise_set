//
//  RiseSetTravelTimes.m
//  asgt5_location_sunrise_set
//
//  Created by William Short on 5/16/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import "RiseSetTravelTimes.h"

@implementation RiseSetTravelTimes

@synthesize riseTime;

@synthesize setTime;

@synthesize travelTime;

-(id) initWithRiseTime:(NSString*) rising andSetTime:(NSString*) setting andTravelTime:(NSString*) traveling
{
    self = [super init];
    if(self)
    {
        riseTime = rising;
        setTime = setting;
        travelTime = traveling;
    }
    return self;
}

@end
