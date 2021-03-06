//
//  VenueEntity.h
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//


//This model class is used to receive the json objects

#import "JSONModel.h"

@protocol ScheduleModel @end

@interface VenueModel : JSONModel
@property (nonatomic)NSUInteger         venueId;
@property (nonatomic)NSInteger          pcode;
@property (nonatomic, strong)NSURL    * ticketLink;
@property (nonatomic, strong)NSURL    <Optional>* imageUrl;
@property (nonatomic, strong)NSNumber * longitude;
@property (nonatomic, strong)NSNumber * latitude;
@property (nonatomic, strong)NSString * zip;
@property (nonatomic, strong)NSString * phone;
@property (nonatomic, strong)NSString * state;
@property (nonatomic, strong)NSString * city;
@property (nonatomic, strong)NSString * tollfreephone;
@property (nonatomic, strong)NSString * address;
@property (nonatomic, strong)NSString * venueDescription;
@property (nonatomic, strong)NSString * name;
@property (nonatomic, strong)NSArray <ScheduleModel, Optional>  * schedule;
@end
