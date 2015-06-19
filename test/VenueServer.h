//
//  VenueServer.h
//  test
//
//  Created by Juan Garcia on 18/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//


//Data source used by the repository to reach the
//information provided by the cloud for this application.

@import Foundation;

@interface VenueServer : NSObject
- (void)listWithSuccess:(void (^)(NSArray *venues))success failure:(void (^)(NSError *error))failure;
@end
