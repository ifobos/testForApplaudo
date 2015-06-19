//
//  VenueViewController.m
//  test
//
//  Created by Juan Garcia on 18/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "VenueViewController.h"
#import <MapKit/MapKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "JRTMainRouter.h"

@interface VenueViewController ()<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *tollFreePhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *scheduleLabel;
@end

@implementation VenueViewController

- (VenueController *)venueController
{
    if (!_venueController)
    {
        _venueController = [VenueController new];
        _venueController.venueViewController = self;
    }
    return _venueController;
}

- (void)viewDidLoad
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        self.navigationItem.leftBarButtonItem = [((UISplitViewController *)[[JRTMainRouter sharedInstance] rootViewController]) displayModeButtonItem];
        self.navigationItem.leftItemsSupplementBackButton = YES;
    }
    [super viewDidLoad];
    
    [self setUp];
    [self reloadData];
}

- (void)setUp
{
    self.title = @"Details";
    [self.mapView setShowsUserLocation:YES];
}

- (void)reloadData
{
    self.nameLabel.text             = [self.venueController name];
    self.phoneLabel.text            = [self.venueController phone];
    self.tollFreePhoneLabel.text    = [self.venueController tollfreephone];
    self.addressLabel.text          = [self.venueController fullAddress];
    self.descriptionLabel.text      = [self.venueController venueDescription];
    [self.imageView sd_setImageWithURL:[self.venueController imageUrl]];
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView setRegion: [self.mapView regionThatFits: [self.venueController region] ] animated: YES];
    [self.mapView addAnnotation:[self.venueController point]];
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger number = [self.venueController numberOfSchedule];
    self.scheduleLabel.hidden = (number == 0);
    return number;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier  = @"scheduleCell";
    UITableViewCell *cell                   = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (!cell) cell                         = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    cell.selectionStyle                     = UITableViewCellSelectionStyleNone;
    cell.textLabel.text                     = [self.venueController startDateScheduleAtIndex:indexPath.row];
    cell.detailTextLabel.text               = [self.venueController endDateScheduleAtIndex: indexPath.row];
    return cell;
}


- (IBAction)goToTicketLink:(id)sender
{
    NSURL *url =[self.venueController ticketLink];
    if ([[url path] length] > 0)
    {
        [[UIApplication sharedApplication] openURL:url];
    }
    else
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"URL not found." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}


@end
