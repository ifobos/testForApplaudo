//
//  JRTMainRouter.h
//  
//
//  Created by Juan Garcia on 31/3/15.
//  Copyright (c) 2015 Jerti LLC. All rights reserved.
//

@import UIKit;
#import "VenuesViewController.h"
#import "VenueViewController.h"
@interface JRTMainRouter : NSObject
@property (nonatomic, strong)VenuesViewController   *firstViewController;
@property (nonatomic, strong)VenueViewController    *secondViewController;

- (id)rootViewController;
+ (instancetype)sharedInstance;
@end
