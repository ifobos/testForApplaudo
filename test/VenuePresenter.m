//
//  VenuePresenter.m
//  test
//
//  Created by Juan Garcia on 18/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "VenuePresenter.h"
#import "ScheduleEntity.h"
@interface VenuePresenter ()
@property (nonatomic, strong)VenueEntity *venue;
@end


@implementation VenuePresenter

- (void)setVenue:(VenueEntity *)venue
{
    _venue = venue;
}

- (NSString*)name
{
    if ([self.venue.name length] > 0) return self.venue.name;
    else return @"--";
}

- (NSString*)phone
{
    if ([self.venue.phone length] > 0) return self.venue.phone;
    else return @"--";
}

- (NSString*)tollfreephone
{
    if ([self.venue.tollfreephone length] > 0) return self.venue.tollfreephone;
    else return @"--";
}

- (NSString*)fullAddress
{
    NSMutableString *address = [NSMutableString new];
    [address appendFormat:@"%@ ",self.venue.address];
    if ([self.venue.city length] > 0) [address appendFormat:@"%@ ",self.venue.city];
    if ([self.venue.state length] > 0) [address appendFormat:@"%@ ",self.venue.state];
    if ([self.venue.zip length] > 0) [address appendFormat:@"%@ ",self.venue.zip];
    return (NSString *)address;
}

- (NSString*)venueDescription
{
    if ([self.venue.venueDescription length] > 0) return self.venue.venueDescription;
    else return @"--";
}

- (NSURL*)ticketLink
{
    return self.venue.ticketLink;
}

- (NSURL*)imageUrl
{
    return self.venue.imageUrl;
}

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D      coordinate;
    coordinate.latitude         = [self.venue.latitude floatValue];
    coordinate.longitude        = [self.venue.longitude floatValue];
    return coordinate;
}

- (MKCoordinateRegion)region
{
    MKCoordinateRegion region   = MKCoordinateRegionMake ([self coordinate], MKCoordinateSpanMake (0.5, 0.5));
    return region;
}

- (MKPointAnnotation *) point
{
    MKPointAnnotation * point   = [[MKPointAnnotation alloc]init];
    point.coordinate            = [self coordinate];
    point.title                 = self.venue.name;
    return point;
}

- (NSInteger)numberOfSchedule
{
    return [self.venue.schedule count];
}

- (NSString*)startDateScheduleAtIndex:(NSInteger)index
{

    ScheduleEntity *targetSchedule =  [self.venue.schedule objectAtIndex:index];
   return [NSString stringWithFormat:@"Start: %@",[NSDateFormatter localizedStringFromDate:targetSchedule.startDate dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterShortStyle]];

}

- (NSString*)endDateScheduleAtIndex:(NSInteger)index
{
    ScheduleEntity *targetSchedule =  [self.venue.schedule objectAtIndex:index];
    return [NSString stringWithFormat:@"End: %@",[NSDateFormatter localizedStringFromDate:targetSchedule.endDate dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterShortStyle]];

}


@end
