//
//  ScheduleEntity.m
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "ScheduleModel.h"

@implementation ScheduleModel
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"start_date":   @"startDate",
                                                       @"end_date":     @"endDate"
                                                       }];
}
@end
