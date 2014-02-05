//
//  RPAppDelegate.m
//  RetailPay
//
//  Created by SMC on 1/29/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPAppDelegate.h"
#import "RPLoginVC.h"
#import "REFrostedViewController.h"
#import "RPSideMenuVC.h"
#import "RPNavigationController.h"
#import "RPDashBoardVC.h"
#import "RPAddProductVC.h"
#import "RPShareProductsVC.h"

@implementation RPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    [[RPAccount sharedInstance] loadLastLogin];
    
    if ([RPAccount sharedInstance].authToken && [RPAccount sharedInstance].username)
    {
        [self initializeMenu];
    }
    else
    {
        [self loadLandingVC];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)loadLandingVC
{
    RPLoginVC *vc = [[RPLoginVC alloc] initWithNibName:@"RPLoginVC" bundle:nil];
    UINavigationController *loginNav = [[UINavigationController alloc] initWithRootViewController:vc];
    [loginNav.navigationBar setHidden:YES];
    [_window setRootViewController:loginNav];
    [_window makeKeyAndVisible];
}

- (void)initializeMenu
{
    // Create content and menu controllers
    //
    RPNavigationController *navigationController = [[RPNavigationController alloc] initWithRootViewController:[[RPDashBoardVC alloc] init]];
    RPSideMenuVC *menuController = [[RPSideMenuVC alloc] initWithNibName:@"RPSideMenuVC" bundle:nil];
    
    // Create frosted view controller
    //
    REFrostedViewController *frostedViewController = [[REFrostedViewController alloc] initWithContentViewController:navigationController menuViewController:menuController];
    frostedViewController.direction = REFrostedViewControllerDirectionLeft;
    frostedViewController.liveBlurBackgroundStyle = REFrostedViewControllerLiveBackgroundStyleLight;
    
    // Make it a root controller
    //
    self.window.rootViewController = frostedViewController;
}

@end
