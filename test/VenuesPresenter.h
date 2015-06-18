//
//  VenuesPresenter.h
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "JRTViperPresenterClass.h"

//the presenter is responsible to formatting data,
//present the actions to interactor and present load
//action to next router will be loaded

@interface VenuesPresenter : JRTViperPresenterClass
- (NSString *)nameAtIndex:(NSInteger)index;
- (NSString *)midAddressAtIndex:(NSInteger)index;
- (NSInteger)numberOfVenues;
- (void)presentToView:(NSArray *)venues;
- (void)goToVenueAtIndex:(NSInteger)index;
@end
