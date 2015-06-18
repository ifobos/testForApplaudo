//
//  VenueRouter.h
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "JRTViperRouterClass.h"
#import "VenueEntity.h"

//This class is responsible for launching the viewcontrollers,
//is also responsible for the link between instances:
//presenter, viewcontroller, and himself
//and the passage of information from one presenter to another.

@interface VenueRouter : JRTViperRouterClass
- (void)presenterSetVenue:(VenueEntity*)venue;
- (void)pushInNavigationController:(UINavigationController*)navigationController animated:(BOOL)animated withVenue:(VenueEntity*)venue;
@end
