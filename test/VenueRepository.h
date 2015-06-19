//
//  VenueRepository.h
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//


// The repository mediates between the data source layer 
// and the business layers of the application. It queries 
// the data source for the data, A repository separates the 
// business logic from the interactions with the underlying 
// data source or Web service.


@import Foundation;


@interface VenueRepository : NSObject
- (void)listWithSuccess:(void (^)(NSArray *venues))success failure:(void (^)(NSError *error))failure;;
@end
