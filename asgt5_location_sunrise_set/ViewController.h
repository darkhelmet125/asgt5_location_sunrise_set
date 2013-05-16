//
//  ViewController.h
//  asgt5_location_sunrise_set
//
//  Created by William Short on 5/6/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "USCitiesTimezoneDatabase.h"
#import "State.h"
#import "City.h"

@interface ViewController : UIViewController
- (IBAction)findMeButtonPress:(id)sender;
- (IBAction)chooseLocationButtonPressed:(id)sender;
@property (nonatomic, retain) NSArray* stateList;
@end
