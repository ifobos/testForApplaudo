//
//  VenueRepository.h
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VenueRepository : NSObject
- (void)listWithSuccess:(void (^)(NSArray *venues))success failure:(void (^)(NSError *error))failure;;
@end
