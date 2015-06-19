//
//  JRTMainRouter.h
//  
//
//  Created by Juan Garcia on 18/6/15.
//  Copyright (c) 2015 Juan Garcia LLC. All rights reserved.
//

//this class is responsible to make the main navigation
//struct to appDelegate. in this case will be an
//splitViewController or navigationController, depend of
//device.

@import UIKit;
#import "VenuesViewController.h"
#import "VenueViewController.h"
@interface MainRouter : NSObject
@property (nonatomic, strong)VenuesViewController   *firstViewController;
@property (nonatomic, strong)VenueViewController    *secondViewController;

- (id)rootViewController;
+ (instancetype)sharedInstance;
@end
