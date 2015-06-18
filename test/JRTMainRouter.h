//
//  JRTMainRouter.h
//  
//
//  Created by Juan Garcia on 31/3/15.
//  Copyright (c) 2015 Jerti LLC. All rights reserved.
//

@import UIKit;
#import "JRTViperRouterProtocol.h" //this protocol is used to define classes conform to routers class of VIPER Pattern

@interface JRTMainRouter : NSObject
@property (nonatomic, strong) id<RouterProtocol> firstRouter;
@property (nonatomic, strong) id<RouterProtocol> secondRouter;

- (id)rootViewController;
+ (instancetype)sharedInstance;
@end
