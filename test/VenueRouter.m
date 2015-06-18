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

- (void)pushInNavigationController:(UINavigationController*)navigationController animated:(BOOL)animated withVenue:(VenueEntity*)venue
{
    [super pushInNavigationController:navigationController animated:animated];
    [self.venuePresenter setVenue:venue];
    
}

@end
