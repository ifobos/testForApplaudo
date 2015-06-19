//
//  JRTMainRouter.m
//  
//
//  Created by Juan Garcia on 18/6/15.
//  Copyright (c) 2015 Juan Garcia LLC. All rights reserved.
//


//this class is responsible to make the main navigation
//struct to appDelegate. in this case will be an
//splitViewController or navigationController, depend of
//device.

#import "MainRouter.h"

@interface MainRouter ()
@property (nonatomic, strong) UINavigationController    *mainNavigationController;
@property (nonatomic, strong) UISplitViewController     *splitViewController;
@end

@implementation MainRouter

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
        [_mainNavigationController pushViewController:self.firstViewController animated:NO];
    }
    return _mainNavigationController;
}

-(UISplitViewController *)splitViewController
{
    if (!_splitViewController)
    {
        _splitViewController                                = [UISplitViewController new];
        UINavigationController *firstNavigationController   = [[UINavigationController alloc] initWithRootViewController:self.firstViewController];
        UINavigationController *secondNavigationController  = [[UINavigationController alloc] initWithRootViewController:self.secondViewController];
        _splitViewController.delegate                       = self.secondViewController;
        _splitViewController.viewControllers                = @[firstNavigationController, secondNavigationController];
    }
    return _splitViewController;
}

-(VenuesViewController *)firstViewController
{
    if (!_firstViewController) _firstViewController = [VenuesViewController new];
    return _firstViewController;
}

-(VenueViewController *)secondViewController
{
    if (!_secondViewController) _secondViewController = [VenueViewController new];
    return _secondViewController;
}

#pragma mark - Public

- (id)rootViewController
{
//    navigation structure depends on the device in the application is executed (iPad or iPhone)
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) return self.splitViewController;
    else return self.mainNavigationController;
}


@end
