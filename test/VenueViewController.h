//
//  VenueViewController.h
//  test
//
//  Created by Juan Garcia on 18/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

//  ViewController object is an object in an application
//  that control the View Interface that users can see.

@import UIKit;
#import "VenueController.h"

@interface VenueViewController : UITableViewController <UISplitViewControllerDelegate>
@property(nonatomic, strong)VenueController * venueController;
- (void)reloadData;
@end
