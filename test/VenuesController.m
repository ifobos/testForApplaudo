//
//  VenuesController.m
//  test
//
//  Created by Juan Garcia on 18/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "VenuesController.h"
#import "VenuesViewController.h"
#import "VenueModel.h"
#import "VenueRepository.h"
#import "JRTMainRouter.h"

@interface VenuesController ()
@property (nonatomic, strong)NSArray            * venues;
@property (nonatomic, strong)VenueRepository    * venueRepository;
@end

@implementation VenuesController

#pragma mark - Getter

- (VenuesViewController *)venuesViewController
{
    if (!_venuesViewController)
        @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"%@", self.class]
                                           reason:[NSString stringWithFormat:@"%@ is nil, ViewController should be assigned himself at this property when the instance of VenuesController is created ", NSStringFromSelector(_cmd)]
                                         userInfo:nil];
    return _venuesViewController;
}

- (NSArray *)venues
{
    if (!_venues)
    {
        _venues = [NSArray new];
        [self.venueRepository listWithSuccess:^(NSArray *venues)
        {
            self.venues = venues;
            [self.venuesViewController.tableView reloadData];
        }
        failure:^(NSError *error)
        {
            NSLog(@"Error %@",error);
        }];
    }
    return _venues;
        
}

- (VenueRepository *)venueRepository
{
    if (!_venueRepository) _venueRepository = [VenueRepository new];
    return _venueRepository;
}

#pragma mark - Public

- (NSInteger)numberOfVenues
{
    return [self.venues count];
}

- (NSString *)nameAtIndex:(NSUInteger)index
{
    VenueModel * targetEntity = [self.venues objectAtIndex:index];
    return targetEntity.name;
}

- (NSString *)midAddressAtIndex:(NSUInteger)index
{
    VenueModel *targetVenue = [self.venues objectAtIndex:index];
    NSMutableString *address = [NSMutableString new];
    if ([targetVenue.address length] > 0)   [address appendFormat:@"%@,",targetVenue.address];
    if ([targetVenue.state length]   > 0)   [address appendFormat:@" %@",targetVenue.state];
    if ([targetVenue.zip length]     > 0)   [address appendFormat:@" %@",targetVenue.zip];
    return (NSString *)address;
}


#pragma mark - Navigation

- (void)goToVenueAtIndex:(NSUInteger)index
{
    VenueModel *targetVenue = [self.venues objectAtIndex:index];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [JRTMainRouter sharedInstance].secondViewController.venueController.venueEntity = targetVenue;
        [[JRTMainRouter sharedInstance].secondViewController.venueController reloadViewController];
    }
    else
    {
        VenueViewController *nextController = [VenueViewController new];
        nextController.venueController.venueEntity = targetVenue;
        [self.venuesViewController.navigationController pushViewController:nextController animated:YES];
    }

    
}



@end
