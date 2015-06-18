//
//  VenueRepository.m
//  test
//
//  Created by Juan Garcia on 17/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "VenueRepository.h"
#import "VenueServer.h"

@interface VenueRepository ()
@property (nonatomic, strong)VenueServer *venueServer;
@property (nonatomic, strong)NSArray *venues;
@end
@implementation VenueRepository

-(VenueServer *)venueServer
{
    if (!_venueServer) _venueServer = [VenueServer new];
    return _venueServer;
}

- (void)listWithSuccess:(void (^)(NSArray *venues))success failure:(void (^)(NSError *error))failure
{
    if (self.venues && [self.venues count] > 0)
    {
        success(self.venues);
    }
    [self.venueServer listWithSuccess:^(NSArray *venues)
    {
        self.venues = venues;
        success(self.venues);
    } failure:failure];
}


@end
