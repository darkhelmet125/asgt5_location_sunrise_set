//
//  detailViewController.m
//  asgt5_location_sunrise_set
//
//  Created by William Short on 5/15/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import "detailViewController.h"

@interface detailViewController ()

@end

@implementation detailViewController

@synthesize userLocation;
@synthesize timezone;
@synthesize sunriseLabel;
@synthesize sunsetLabel;
@synthesize travelTimeLabel;
@synthesize myCity;
@synthesize myTimes;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"%p",self);
    self.userLocation.text = [NSString stringWithFormat:@"%@, %@",self.myCity.city, self.myCity.state];
    self.timezone.text = [NSString stringWithFormat:@"%@",self.myCity.timezone];
    self.sunriseLabel.text = [NSString stringWithFormat:@"%@",self.myTimes.riseTime];
    self.sunsetLabel.text = [NSString stringWithFormat:@"%@",self.myTimes.setTime];
    self.travelTimeLabel.text = [NSString stringWithFormat:@"%@",self.myTimes.travelTime];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
