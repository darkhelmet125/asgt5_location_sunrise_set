//
//  USCitiesTimezoneDatabase.m
//  asgt5_location_sunrise_set
//
//  Created by William Short on 5/7/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import "USCitiesTimezoneDatabase.h"

@implementation USCitiesTimezoneDatabase

static USCitiesTimezoneDatabase* _databaseObj;

+ (USCitiesTimezoneDatabase*) database
{
    if (_databaseObj == nil) {
        _databaseObj = [[USCitiesTimezoneDatabase alloc] init];
    }
    return _databaseObj;
}

- (id) init{
    self = [super init];
    if (self) {
        NSString* dbpath = [[NSBundle mainBundle] pathForResource:@"us_cities_with_timezones" ofType:@"sl3"];
        if (sqlite3_open([dbpath UTF8String], &_databaseConnection) != SQLITE_OK) {
            NSLog(@"Failed to open database.");
        }
    }
    return self;
}

- (void) dealloc
{
    sqlite3_close(_databaseConnection);
}

- (NSArray*) byState
{
    NSMutableArray* rv = [[NSMutableArray alloc] init];
    NSString* query = @"SELECT distinct state FROM cities order by state;";
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString *state;
    if( sqlite3_prepare_v2(_databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK){
        while( sqlite3_step(stmt) == SQLITE_ROW){
            text = sqlite3_column_text(stmt, 0);
            if(text)
                state = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                state = nil;
            State *thisState = [[State alloc] initWithState:state];
            [rv addObject: thisState];
        }
        sqlite3_finalize(stmt);
    }
    return rv;
}

- (NSArray*) byCity:(NSString*) stateName
{
    NSMutableArray* rv = [[NSMutableArray alloc] init];
    NSString* query = [NSString stringWithFormat: @"SELECT * FROM cities where state = '%@' order by name;", stateName];
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString  *city, *state, *timezone;
    double longitude, latitude;
    if( sqlite3_prepare_v2(_databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK){
        while( sqlite3_step(stmt) == SQLITE_ROW){
            text = sqlite3_column_text(stmt, 0);
            if( text )
                city = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                city = nil;
            text = sqlite3_column_text(stmt, 1);
            if(text)
                state = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                state = nil;
            latitude = sqlite3_column_double(stmt, 2);
            longitude = sqlite3_column_double(stmt, 3);
            text = sqlite3_column_text(stmt, 4);
            if(text)
                timezone = [NSString stringWithCString:(const char*)text encoding:NSUTF8StringEncoding];
            else
                timezone = nil;
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(latitude, longitude);
            City *thisCity = [[City alloc] initWithCity:city andState:state andTimezone:timezone andCoordinate:coord];
            [rv addObject: thisCity];
        }
        sqlite3_finalize(stmt);
    }
    return rv;
}
@end
