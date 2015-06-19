//
//  VenueRepository.m
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

#import "VenueRepository.h"
#import "VenueServer.h"

@interface VenueRepository ()
@property (nonatomic, strong)VenueServer *venueServer;
@property (nonatomic, strong)NSArray *venues;
@end

@implementation VenueRepository

#pragma mark - Getter

- (VenueServer *)venueServer
{
    if (!_venueServer) _venueServer = [VenueServer new];
    return _venueServer;
}

#pragma mark - Public

- (void)listWithSuccess:(void (^)(NSArray *venues))success failure:(void (^)(NSError *error))failure
{
    if (self.venues && [self.venues count] > 0)
    {
//        In this particular case is not necessary
//        make more request to the server, because
//        tee objects required are be in memory.
//        (the objets are not save in application
//        file, only be in memory when the request
//        be successful the first time each start
//        application).
        success(self.venues);
    }
    [self.venueServer listWithSuccess:^(NSArray *venues)
    {
        self.venues = venues;
        success(self.venues);
    } failure:failure];
}


@end
