//
//  detailViewController.h
//  asgt5_location_sunrise_set
//
//  Created by William Short on 5/15/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *userLocation;
@property (weak, nonatomic) IBOutlet UILabel *timezone;
@property (retain, nonatomic) IBOutlet UILabel *sunriseLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunsetLabel;
@property (weak, nonatomic) IBOutlet UILabel *travelTimeLabel;

@end
