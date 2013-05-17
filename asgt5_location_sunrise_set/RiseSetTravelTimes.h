//
//  RiseSetTravelTimes.h
//  asgt5_location_sunrise_set
//
//  Created by William Short on 5/16/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RiseSetTravelTimes : NSObject

@property NSString* riseTime;

@property NSString* setTime;

@property NSString* travelTime;

-(id) initWithRiseTime:(NSString*) rising andSetTime:(NSString*) setting andTravelTime:(NSString*) travelling;

@end
