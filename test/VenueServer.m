//
//  VenueServer.m
//  test
//
//  Created by Juan Garcia on 18/6/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

//Data source used by the repository to reach the
//information provided by the cloud for this application.


#import "VenueServer.h"
#import "VenueModel.h"
#import "AFNetworking.h"

static NSString * const URLString = @"https://s3.amazonaws.com/jon-hancock-phunware/nflapi-static.json";

@implementation VenueServer

#pragma mark - Request

- (void)listWithSuccess:(void (^)(NSArray *venues))success failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperation *operation                   = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URLString]]];
    operation.responseSerializer                        = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSError *error;
         NSArray * models = [VenueModel arrayOfModelsFromDictionaries:responseObject error:&error];
         if (error) failure(error);
         else success(models);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         failure(error);
     }];
    [operation start];
}

@end
