//
//  VenueEntity.m
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

//This model class is used to receive the json objects

#import "VenueModel.h"

@implementation VenueModel

//mapping - "model properties" vs "json Attributes"

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id":                   @"venueId",
                                                       @"pcode":                @"pcode",
                                                       @"ticket_link":          @"ticketLink",
                                                       @"image_url":            @"imageUrl",
                                                       @"schedule":             @"schedule",
                                                       @"longitude":            @"longitude",
                                                       @"latitude":             @"latitude",
                                                       @"zip":                  @"zip",
                                                       @"phone":                @"phone",
                                                       @"state":                @"state",
                                                       @"city":                 @"city",
                                                       @"tollfreephone":        @"tollfreephone",
                                                       @"address":              @"address",
                                                       @"description":          @"venueDescription",
                                                       @"name":                 @"name"
                                                       }];
}

@end
