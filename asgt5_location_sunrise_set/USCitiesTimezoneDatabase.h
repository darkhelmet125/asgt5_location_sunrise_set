//
//  USCitiesTimezoneDatabase.h
//  asgt5_location_sunrise_set
//
//  Created by William Short on 5/7/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "State.h"
#import "City.h"

@interface USCitiesTimezoneDatabase : NSObject
{
    sqlite3* _databaseConnection;
}

+ (USCitiesTimezoneDatabase*) database;
- (NSArray*) byState;
- (NSArray*) byCity:(NSString*) stateName;
@end
