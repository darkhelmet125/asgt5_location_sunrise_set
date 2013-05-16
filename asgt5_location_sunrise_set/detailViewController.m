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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
