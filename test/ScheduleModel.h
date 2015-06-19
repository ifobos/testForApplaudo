//
//  ScheduleEntity.h
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

//This model class is used to receive the json sub-objects

#import "JSONModel.h"

@interface ScheduleModel : JSONModel
@property (nonatomic, strong)NSDate *startDate;
@property (nonatomic, strong)NSDate *endDate;
@end
