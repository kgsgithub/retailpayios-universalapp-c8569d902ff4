//
//  RPNavigationController.m
//  RetailPay
//
//  Created by Administrator on 2/2/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPNavigationController.h"
#import "RPSideMenuVC.h"
#import "UIViewController+REFrostedViewController.h"
#import "REFrostedViewController.h"

@interface RPNavigationController ()

@property (strong, readwrite, nonatomic) RPSideMenuVC *menuVC;

@end

@implementation RPNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
}

- (void)showMenu
{
    [self.frostedViewController presentMenuViewController];
}

#pragma mark -
#pragma mark Gesture recognizer

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    [self.frostedViewController panGestureRecognized:sender];
}

@end
