//
//  VenueServer.h
//  test
//
//  Created by Juan Garcia on 18/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VenueServer : NSObject
- (void)listWithSuccess:(void (^)(NSArray *venues))success failure:(void (^)(NSError *error))failure;
@end
