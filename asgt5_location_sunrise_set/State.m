//
//  State.m
//  asgt5_location_sunrise_set
//
//  Created by William Short on 5/7/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import "State.h"

@implementation State

@synthesize stateName;
@synthesize timezone;


-(id) initWithState:(NSString*) theState andTimezone:(NSString*) theTimezone
{
    self = [super init];
    if(self)
    {
        stateName = theState;
        timezone = theTimezone;
    }
    return self;
}

@end
