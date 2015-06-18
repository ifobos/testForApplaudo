//
//  VenuesPresenter.h
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "JRTViperPresenterClass.h"

@interface VenuesPresenter : JRTViperPresenterClass
- (NSString *)nameAtIndex:(NSInteger)index;
- (NSString *)midAddressAtIndex:(NSInteger)index;
- (NSInteger)numberOfVenues;
- (void)presentToView:(NSArray *)venues;
- (void)goToVenueAtIndex:(NSInteger)index;
@end
