//
//  VenueRepository.h
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>

//this class is used like content provider, this class
//connect with another class like a service to use
//the network or maybe cache in the future.

@interface VenueRepository : NSObject
- (void)listWithSuccess:(void (^)(NSArray *venues))success failure:(void (^)(NSError *error))failure;;
@end
