//
//  CityTableViewController.h
//  asgt5_location_sunrise_set
//
//  Created by William Short on 5/7/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "City.h"
#import "ViewController.h"
#import "USCitiesTimezoneDatabase.h"

@interface CityTableViewController : UITableViewController

@property (nonatomic, retain) NSArray* cities;
@property (nonatomic, retain) NSString* state;
@property int rowPressed;
@property (nonatomic, retain) City* myCity;

@end
