//
//  RPSignUpSuccessVC.m
//  RetailPay
//
//  Created by lion on 2/3/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPSignUpSuccessVC.h"
#import "RPSignInVC.h"

@interface RPSignUpSuccessVC ()

@end

@implementation RPSignUpSuccessVC

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

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onNavigationMenuClicked:(UIButton *)sender
{
    //goes to main tab navigation.
}

- (IBAction)onLoginHereClicked:(UIButton *)sender
{
    NSLog(@"Goto SignIn view");
    
    RPSignInVC *signinVC;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        signinVC = [[RPSignInVC alloc] initWithNibName:@"RPSignInVC" bundle:nil];
    } else {
        signinVC = [[RPSignInVC alloc] initWithNibName:@"RPSignInVC-iPad" bundle:nil];
    }
    
    [self.navigationController pushViewController:signinVC animated:YES];
}
@end
