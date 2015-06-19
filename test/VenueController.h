//
//  VenueController.h
//  test
//
//  Created by Juan Garcia on 18/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//


//  In this particular architecture the controller
//  object acts as an intermediary between Model and
//  ViewController. Controller objects are thus a
//  conduit through which view objects learn about
//  changes in model objects.

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
