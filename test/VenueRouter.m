//
//  VenueRouter.m
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "VenueRouter.h"
#import "VenuePresenter.h"

@interface VenueRouter ()
@property(nonatomic, readonly)VenuePresenter *venuePresenter;
@end

@implementation VenueRouter

-(VenuePresenter *)venuePresenter
{
    return (VenuePresenter *)self.presenter;
}

- (void)presenterSetVenue:(VenueEntity*)venue
{
   [self.venuePresenter setVenue:venue];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) [self.venuePresenter refreshView];
}

- (void)pushInNavigationController:(UINavigationController*)navigationController animated:(BOOL)animated withVenue:(VenueEntity*)venue
{
    [self presenterSetVenue:venue];
    [super pushInNavigationController:navigationController animated:animated];
}

@end
