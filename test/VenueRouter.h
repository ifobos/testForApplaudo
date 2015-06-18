//
//  VenueRouter.h
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "JRTViperRouterClass.h"
#import "VenueEntity.h"

@interface VenueRouter : JRTViperRouterClass
- (void)pushInNavigationController:(UINavigationController*)navigationController animated:(BOOL)animated withVenue:(VenueEntity*)venue;
@end
