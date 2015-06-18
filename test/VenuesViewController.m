//
//  VenuesViewController.m
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "VenuesViewController.h"
#import "VenuesPresenter.h"
@interface VenuesViewController ()
@property (nonatomic, readonly)VenuesPresenter *venuesPresenter;
@end

@implementation VenuesViewController

-(VenuesPresenter *)venuesPresenter
{
    return (VenuesPresenter*)self.presenter;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Venues";
    [self loadFromPresenter];
}

- (void)loadFromPresenter
{
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.venuesPresenter numberOfVenues];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier  = @"cell";
    UITableViewCell *cell                   = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (!cell) cell                         = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    cell.accessoryType                      = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text                     = [self.venuesPresenter nameAtIndex:indexPath.row];
    cell.detailTextLabel.text               = [self.venuesPresenter midAddressAtIndex: indexPath.row];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.tableView.userInteractionEnabled = NO;
    [self.venuesPresenter goToVenueAtIndex:indexPath.row];
    self.tableView.userInteractionEnabled = YES;
}

@end
