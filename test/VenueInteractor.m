//
//  VenueInteractor.m
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "VenueInteractor.h"
#import "VenueRepository.h"
#import "VenuesPresenter.h"

@interface VenueInteractor ()
@property (nonatomic, strong)VenueRepository *venueRepository;
@property (nonatomic, readonly)VenuesPresenter *venuesPresenter;
@end

@implementation VenueInteractor

-(VenueRepository *)venueRepository
{
    if (!_venueRepository) _venueRepository = [VenueRepository new];
    return _venueRepository;
}

-(VenuesPresenter *)venuesPresenter
{
    if ([((id)self.presenter) isKindOfClass:[VenuesPresenter class]]) return (VenuesPresenter *)self.presenter;
    else return nil;
}


-(void)loadVenues
{
    [self.venueRepository listWithSuccess:^(NSArray *venues)
    {
        [self.venuesPresenter presentToView:venues];

    } failure:^(NSError *error)
    {
        NSLog(@"Error %@",error);
    }];
}

@end
