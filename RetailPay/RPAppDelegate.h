//
//  RPAppDelegate.h
//  RetailPay
//
//  Created by SMC on 1/29/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)initializeMenu;
- (void)loadLandingVC;

@end
