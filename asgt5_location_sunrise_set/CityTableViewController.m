//
//  CityTableViewController.m
//  asgt5_location_sunrise_set
//
//  Created by William Short on 5/7/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import "CityTableViewController.h"
#import "detailViewController.h"
#include <libnova/solar.h>
#include <libnova/julian_day.h>
#include <libnova/rise_set.h>
#include <libnova/transform.h>
#include <libnova/utility.h>
#include <libnova/refraction.h>

@interface CityTableViewController ()

@end

@implementation CityTableViewController

@synthesize cities;
@synthesize state;
@synthesize myCity;
@synthesize mySunTimes;
@synthesize mySunrise;
@synthesize mySunset;
@synthesize myTravel;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.cities = [[USCitiesTimezoneDatabase database] byCity:state];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"myCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil) {
		// Use the default cell style.
		//cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
    }
    
    City* city = [self.cities objectAtIndex: indexPath.row];
    cell.textLabel.text = city.city;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
    self.myCity = [self.cities objectAtIndex:selectedRowIndex.row];
    static struct ln_lnlat_posn observer;
    static double JD;
    static struct ln_helio_posn pos;
    static struct ln_equ_posn equ;
    
    observer.lat = myCity.coord.latitude;
    observer.lng = myCity.coord.longitude;
    
    JD = ln_get_julian_from_sys();
    ln_get_solar_geom_coords(JD, &pos);
    ln_get_solar_equ_coords(JD, &equ);
    
    struct ln_rst_time rst;
    struct ln_zonedate rise, set, transit;
    NSLog(@"prepareForSegue: %@", segue.identifier);
    if ([segue.identifier isEqualToString:@"detailViewSegue"])
    {
        detailViewController* detailVC = segue.destinationViewController;
        
        NSLog(@"%p",detailVC);

        if( ln_get_solar_rst_horizon(JD, &observer, LN_SOLAR_STANDART_HORIZON, &rst) == 1 )
        {
            printf ("Sun is circumpolar\n");
        }
        else
        {
            ln_get_local_date(rst.rise, &rise);
            ln_get_local_date(rst.transit, &transit);
            ln_get_local_date(rst.set, &set);

            NSString* sunrise = [NSString stringWithFormat:@"%.2d:%.2d:%.2d",rise.hours,rise.minutes,(int) round(rise.seconds)];
            NSString* sunset = [NSString stringWithFormat:@"%.2d:%.2d:%.2d",set.hours,set.minutes,(int) round(set.seconds)];
            NSString* travel = [NSString stringWithFormat:@"%.2d:%.2d:%.2d",transit.hours,transit.minutes,(int)round(transit.seconds)];
            
            self.mySunrise = sunrise;
            self.mySunset = sunset;
            self.myTravel = travel;
            
            [self.mySunTimes initWithRiseTime:self.mySunrise andSetTime:self.mySunset andTravelTime:self.myTravel];
            
            NSLog(@"sunrise: %@",self.mySunTimes.riseTime);
            NSLog(@"sunset: %@",self.mySunTimes.setTime);
            NSLog(@"travel: %@",self.mySunTimes.travelTime);
            
            detailVC.myCity = [self.cities objectAtIndex:selectedRowIndex.row];
            //detailVC.myTimes = [self.mySunTimes initWithRiseTime:self.mySunrise andSetTime:mySunset andTravelTime:myTravel];
            
            /*
            NSLog(@"sunrise1: %@",detailVC.myTimes.riseTime);
            NSLog(@"sunset1: %@",detailVC.myTimes.setTime);
            NSLog(@"travel1: %@",detailVC.myTimes.travelTime);
            */
            
            if(self.mySunTimes == nil)
                NSLog(@"mySunTimes is nil");
            if(self.mySunTimes.riseTime == nil)
                NSLog(@"mySunTimes.riseTime is nil");
            
            NSLog(@"rise: %.2d:%.2d:%.2d",rise.hours,rise.minutes,(int) round(rise.seconds));
            NSLog(@"set: %.2d:%.2d:%.2d",set.hours,set.minutes,(int) round(set.seconds));
            NSLog(@"travel: %.2d:%.2d:%.2d",transit.hours,transit.minutes,(int)round(transit.seconds));
        }
    }
}

@end
