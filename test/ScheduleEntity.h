//
//  ScheduleEntity.h
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "JSONModel.h"

@interface ScheduleEntity : JSONModel
@property (nonatomic, strong)NSDate *startDate;
@property (nonatomic, strong)NSDate *endDate;
@end
