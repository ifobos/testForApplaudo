//
//  VenuesViewController.m
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

//  ViewController object is an object in an application
//  that control the View Interface that users can see.

#import "VenuesViewController.h"
#import "VenuesController.h"

@interface VenuesViewController ()
@property (nonatomic, strong)VenuesController *venuesController;
@end

@implementation VenuesViewController

#pragma mark - Getter

- (VenuesController *)venuesController
{
    if (!_venuesController)
    {
        _venuesController = [VenuesController new];
        _venuesController.venuesViewController = self;
    }
    return _venuesController;
}

#pragma mark - ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Venues";
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.venuesController numberOfVenues];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier  = @"cell";
    UITableViewCell *cell                   = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (!cell) cell                         = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    cell.accessoryType                      = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text                     = [self.venuesController nameAtIndex:indexPath.row];
    cell.detailTextLabel.text               = [self.venuesController midAddressAtIndex: indexPath.row];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.tableView.userInteractionEnabled = NO;
    [self.venuesController goToVenueAtIndex:indexPath.row];
    self.tableView.userInteractionEnabled = YES;
}

@end
