//
//  VenuesPresenter.m
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "VenuesPresenter.h"
#import "VenueInteractor.h"
#import "VenuesViewController.h"
#import "VenueEntity.h"
#import "VenueRouter.h"
#import "JRTMainRouter.h"

@interface VenuesPresenter ()
@property(nonatomic, readonly)VenueInteractor *venueInteractor;
@property(nonatomic, readonly)VenuesViewController *venuesViewController;
@property(nonatomic, strong)NSArray *venues;
@end

@implementation VenuesPresenter

- (NSArray *)venues
{
    if (!_venues) [self.venueInteractor loadVenues];
    return _venues;
}

-(VenuesViewController *)venuesViewController
{
    return (VenuesViewController *)self.viewController;
}

- (VenueInteractor *)venueInteractor
{
    return (VenueInteractor *)self.interactor;
}

@synthesize interactor = _interactor;
- (id<InteractorProtocol>)interactor
{
    if (!_interactor) _interactor = [VenueInteractor new];
    return _interactor;
}

- (NSInteger)numberOfVenues
{
    return [self.venues count];
}

- (NSString *)nameAtIndex:(NSInteger)index
{
    VenueEntity *targetVenue = [self.venues objectAtIndex:index];
    return targetVenue.name;
}

- (NSString *)midAddressAtIndex:(NSInteger)index
{
    VenueEntity *targetVenue = [self.venues objectAtIndex:index];
    return [NSString stringWithFormat:@"%@, %@ %@", targetVenue.address, targetVenue.state, targetVenue.zip];
}

- (void)presentToView:(NSArray *)venues
{
    self.venues = venues;
    [self.venuesViewController loadFromPresenter];
}

- (void)goToVenueAtIndex:(NSInteger)index
{
    VenueRouter *venueRouter = [VenueRouter new];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [((VenueRouter*)[JRTMainRouter sharedInstance].secondRouter) presenterSetVenue:[self.venues objectAtIndex:index]];
    }
    else [venueRouter pushInNavigationController:self.venuesViewController.navigationController animated:YES withVenue:[self.venues objectAtIndex:index]];



    
}

@end
