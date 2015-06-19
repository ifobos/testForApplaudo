//
//  VenueViewController.h
//  test
//
//  Created by Juan Garcia on 18/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

@import UIKit;
#import "VenueController.h"

@interface VenueViewController : UITableViewController <UISplitViewControllerDelegate>
@property(nonatomic, strong)VenueController * venueController;
- (void)reloadData;
@end
