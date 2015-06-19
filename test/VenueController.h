//
//  VenueController.h
//  test
//
//  Created by Juan Garcia on 18/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

@import Foundation;
@import MapKit;
#import "VenueModel.h"

@class VenueViewController;

@interface VenueController : NSObject
@property(nonatomic, strong)VenueViewController     *venueViewController;
@property(nonatomic, strong)VenueModel             *venueEntity;
- (void)reloadViewController;

- (NSString*)name;
- (NSString*)phone;
- (NSString*)tollfreephone;
- (NSString*)fullAddress;
- (NSString*)venueDescription;
- (NSURL*)ticketLink;
- (NSURL*)imageUrl;
- (MKCoordinateRegion)region;
- (MKPointAnnotation *) point;
- (NSInteger)numberOfSchedule;
- (NSString*)startDateScheduleAtIndex:(NSInteger)index;
- (NSString*)endDateScheduleAtIndex:(NSInteger)index;
@end
