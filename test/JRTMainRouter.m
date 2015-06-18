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

- (id)rootViewController
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) return self.splitViewController;
    else return self.mainNavigationController;
}


@end
