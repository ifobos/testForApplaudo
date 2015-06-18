//
//  VenuePresenter.h
//  test
//
//  Created by Juan Garcia on 18/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "JRTViperPresenterClass.h"
#import "VenueEntity.h"
#import <MapKit/MapKit.h>

@interface VenuePresenter : JRTViperPresenterClass
- (void)setVenue:(VenueEntity *)venue;

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
