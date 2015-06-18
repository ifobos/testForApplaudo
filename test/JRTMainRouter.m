//
//  JRTMainRouter.m
//  
//
//  Created by Juan Garcia on 31/3/15.
//  Copyright (c) 2015 Jerti LLC. All rights reserved.
//

#import "JRTMainRouter.h"


NSString * const kFirstRouter   = @"VenuesRouter";
NSString * const kSecondRouter  = @"VenueRouter";

@interface JRTMainRouter ()
@property (nonatomic, strong) UINavigationController    *mainNavigationController;
@property (nonatomic, strong) UISplitViewController     *splitViewController;
@end

@implementation JRTMainRouter

#pragma mark - Singleton

//this is a singleton using GCD
+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^
                  {
                      sharedInstance = [self new];
                  });
    
    return sharedInstance;
}

#pragma mark - Getters

//lazy instantiation is used for the most part of properties like mainNavigationController
- (UINavigationController *)mainNavigationController
{
    if (!_mainNavigationController)
    {
        _mainNavigationController = [UINavigationController new];
        [self.firstRouter pushInNavigationController:_mainNavigationController animated:NO];
    }
    return _mainNavigationController;
}

-(UISplitViewController *)splitViewController
{
    if (!_splitViewController)
    {
        _splitViewController                                = [UISplitViewController new];
        UINavigationController *firstNavigationController   = [[UINavigationController alloc] initWithRootViewController:(UIViewController*)self.firstRouter.viewController];
        UINavigationController *secondNavigationController  = [[UINavigationController alloc] initWithRootViewController:(UIViewController*)self.secondRouter.viewController];
        _splitViewController.delegate                       = (id<UISplitViewControllerDelegate>)self.secondRouter.viewController;
        _splitViewController.viewControllers                = @[firstNavigationController, secondNavigationController];
    }
    return _splitViewController;
}

-(id<RouterProtocol>)firstRouter
{
    if (!_firstRouter) _firstRouter = [[NSClassFromString(kFirstRouter) alloc] init];
    return _firstRouter;
}

-(id<RouterProtocol>)secondRouter
{
    if (!_secondRouter) _secondRouter = [[NSClassFromString(kSecondRouter) alloc] init];
    return _secondRouter;
}

#pragma mark - Public

- (id)rootViewController
{
//    navigation structure depends on the device in the application is executed (iPad or iPhone)
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) return self.splitViewController;
    else return self.mainNavigationController;
}


@end
