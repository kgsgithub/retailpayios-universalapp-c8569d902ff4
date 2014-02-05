//
//  RPLoginVC.m
//  RetailPay
//
//  Created by lion on 2/1/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPLoginVC.h"
#import "RPSignUpVC.h"
#import "RPSignInVC.h"

@interface RPLoginVC ()

@end

@implementation RPLoginVC

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
    self.title = @"LogIn";
}

-(void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSignupClicked:(UIButton *)sender {
    NSLog(@"Create SignUp view");
    
    RPSignUpVC *signupVC;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        signupVC = [[RPSignUpVC alloc] initWithNibName:@"RPSignUpVC" bundle:nil];
    } else {
        signupVC = [[RPSignUpVC alloc] initWithNibName:@"RPSignUpVC-iPad" bundle:nil];
    }
    
    [self.navigationController pushViewController:signupVC animated:YES];
//    UINavigationController *navigationController =[[UINavigationController alloc] initWithRootViewController:signupVC];
//    navigationController.navigationBar.barStyle = UIBarStyleDefault;
//    navigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    
//    [self presentViewController:navigationController animated:YES completion:nil];
    
}

- (IBAction)onSigninClicked:(UIButton *)sender {
    NSLog(@"Create Signin view");
    
    RPSignInVC *signinVC;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        signinVC = [[RPSignInVC alloc] initWithNibName:@"RPSignInVC" bundle:nil];
    } else {
        signinVC = [[RPSignInVC alloc] initWithNibName:@"RPSignInVC-iPad" bundle:nil];
    }
    
    [self.navigationController pushViewController:signinVC animated:YES];
   

}
@end
