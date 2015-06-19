//
//  VenuesController.h
//  test
//
//  Created by Juan Garcia on 18/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

@import Foundation;
@class VenuesViewController;

@interface VenuesController : NSObject
@property (nonatomic, strong)VenuesViewController *venuesViewController;
- (NSInteger)numberOfVenues;
- (NSString *)nameAtIndex:(NSUInteger)index;
- (NSString *)midAddressAtIndex:(NSUInteger)index;
- (void)goToVenueAtIndex:(NSUInteger)index;
@end
