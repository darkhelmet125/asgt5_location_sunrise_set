//
//  ViewController.m
//  asgt5_location_sunrise_set
//
//  Created by William Short on 5/6/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import "ViewController.h"
#import "StateTableViewController.h"
#import <CoreLocation/CoreLocation.h>
#include <libnova/solar.h>
#include <libnova/julian_day.h>
#include <libnova/rise_set.h>
#include <libnova/transform.h>
#include <libnova/utility.h>
#include <libnova/refraction.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize stateList;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.stateList = [[USCitiesTimezoneDatabase database] byState];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findMeButtonPress:(id)sender {
    //stuff
}

- (IBAction)chooseLocationButtonPressed:(id)sender {
    //
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue: %@", segue.identifier);
    if ([segue.identifier isEqualToString:@"stateSegue"])
    {
        NSLog(@"successful segue");
        StateTableViewController* detailVC = segue.destinationViewController;
        detailVC.states = self.stateList;
    }
}
@end
