//
//  StateTableViewController.h
//  asgt5_location_sunrise_set
//
//  Created by William Short on 5/7/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "USCitiesTimezoneDatabase.h"

@interface StateTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSArray* states;
@property int rowPressed;

@end
