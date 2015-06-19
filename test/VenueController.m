//
//  VenueController.m
//  test
//
//  Created by Juan Garcia on 18/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "VenueController.h"
#import "VenueViewController.h"
#import "ScheduleModel.h"

@implementation VenueController

-(VenueModel *)venueEntity
{
    if(!_venueEntity)       self.venueViewController.tableView.hidden = YES;
    else                    self.venueViewController.tableView.hidden = NO;
    return _venueEntity;
}

- (VenueViewController *)venueViewController
{
    if (!_venueViewController)
        @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"%@", self.class]
                                           reason:[NSString stringWithFormat:@"%@ is nil, ViewController should be assigned himself at this property when the instance of VenuesController is created ", NSStringFromSelector(_cmd)]
                                         userInfo:nil];
    return _venueViewController;
}

- (void)reloadViewController
{
    [self.venueViewController reloadData];
}

- (NSString*)name
{
    if ([self.venueEntity.name length] > 0) return self.venueEntity.name;
    else return @"--";
}

- (NSString*)phone
{
    if ([self.venueEntity.phone length] > 0) return self.venueEntity.phone;
    else return @"--";
}

- (NSString*)tollfreephone
{
    if ([self.venueEntity.tollfreephone length] > 0) return self.venueEntity.tollfreephone;
    else return @"--";
}

- (NSString*)fullAddress
{
    NSMutableString *address = [NSMutableString new];
    [address appendFormat:@"%@ ",self.venueEntity.address];
    if ([self.venueEntity.city length]  > 0)    [address appendFormat:@"%@ ",self.venueEntity.city];
    if ([self.venueEntity.state length] > 0)    [address appendFormat:@"%@ ",self.venueEntity.state];
    if ([self.venueEntity.zip length]   > 0)    [address appendFormat:@"%@ ",self.venueEntity.zip];
    return (NSString *)address;
}

- (NSString*)venueDescription
{
    if ([self.venueEntity.venueDescription length] > 0) return self.venueEntity.venueDescription;
    else return @"--";
}

- (NSURL*)ticketLink
{
    return self.venueEntity.ticketLink;
}

- (NSURL*)imageUrl
{
    return self.venueEntity.imageUrl;
}

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D      coordinate;
    coordinate.latitude         = [self.venueEntity.latitude floatValue];
    coordinate.longitude        = [self.venueEntity.longitude floatValue];
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
    point.title                 = self.venueEntity.name;
    return point;
}

- (NSInteger)numberOfSchedule
{
    return [self.venueEntity.schedule count];
}

- (NSString*)startDateScheduleAtIndex:(NSInteger)index
{
    ScheduleModel *targetSchedule =  [self.venueEntity.schedule objectAtIndex:index];
    return [NSString stringWithFormat:@"Start:  %@",[[self dateFormatter] stringFromDate:targetSchedule.startDate]];
}

- (NSString*)endDateScheduleAtIndex:(NSInteger)index
{
    ScheduleModel *targetSchedule =  [self.venueEntity.schedule objectAtIndex:index];
    return [NSString stringWithFormat:@"End:  %@",[[self dateFormatter] stringFromDate:targetSchedule.endDate]];
}

- (NSDateFormatter *)dateFormatter
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    [formatter setDateStyle:NSDateFormatterLongStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    return formatter;
}


@end
