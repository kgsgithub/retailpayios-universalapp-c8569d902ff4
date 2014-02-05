//
//  RPAccountVC.m
//  RetailPay
//
//  Created by Administrator on 1/30/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPAccountVC.h"
#import "RPNavigationController.h"
#import "RPSyncContactVC.h"

@interface RPAccountVC ()

@end

@implementation RPAccountVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMenu:(id)sender {
    RPNavigationController *navController = (RPNavigationController *)self.navigationController;
    [navController showMenu];
}

- (IBAction)go2SyncData:(id)sender {
    RPSyncContactVC *vc = [[RPSyncContactVC alloc] initWithNibName:@"RPSyncContactVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)go2Review:(id)sender {
}

- (IBAction)go2FeedbackAndSupport:(id)sender {
}

- (IBAction)go2Logout:(id)sender {
    
    [[RPAccount sharedInstance] clear];
    
    id delegate = [UIApplication sharedApplication].delegate;
    if ([delegate respondsToSelector:@selector(loadLandingVC)]) {
        [delegate performSelector:@selector(loadLandingVC) withObject:nil];
    }
}

@end
