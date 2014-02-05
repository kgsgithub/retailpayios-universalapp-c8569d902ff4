//
//  RPSignInVC.m
//  RetailPay
//
//  Created by lion on 2/1/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPWebAPI.h"
#import "RPAccount.h"
#import "RPSignInVC.h"
#import "RPResetVC.h"
#import "RPSignUpVC.h"
#import "AFHTTPClient.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "AFJSONRequestOperation.h"
#import "MBProgressHUD.h"
#import "RPDashBoardVC.h"

@interface RPSignInVC ()

@end

@implementation RPSignInVC

@synthesize  txtUserName;
@synthesize  txtPassword;

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
    self.title = @"SignIn";
    [self.scrollView setContentSize:CGSizeMake(320, 480)];
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
    
    //set username and password textfiled border.
    [self setTextFieldBorder:txtUserName];
    [self setTextFieldBorder:txtPassword];

}

- (void) setTextFieldBorder:(UITextField*)tf
{
    tf.layer.cornerRadius = 5.0f;
    tf.layer.masksToBounds = YES;
    tf.layer.borderColor=[[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0]CGColor];
    tf.layer.borderWidth = 1.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)onSignInClicked:(UIButton *)sender {
    
    //check usernamd and value
    if([self checkBlankField] == NO)
    {
        return;
    }
    
    [self setResignFirstResponder:txtUserName];
    [self setResignFirstResponder:txtPassword];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    void(^successed)(id responseObject) = ^(id responseObject) {
        //stop loading animation
        [MBProgressHUD hideHUDForView : self.view animated:YES];
        
        // Load user info
        int responseCode = [[responseObject objectForKey:@"responseCode"] intValue];
        if (responseCode != 200)
        {
            [self showAlertTips:@"Username or password is incorrect."];
            [txtUserName becomeFirstResponder];
            return ;
        }
        
        if([responseObject isEqual:nil]){
            [self showAlertTips:@"Connection Problem"];
            [txtUserName becomeFirstResponder];
            return ;
        }
        
        //Json parsing
        NSDictionary *dictResponse = [responseObject objectForKey:@"resource"];
        [RPAccount sharedInstance].authToken = [dictResponse objectForKey:@"authToken"];
        [RPAccount sharedInstance].firstname = [dictResponse objectForKey:@"firstname"];
        [RPAccount sharedInstance].lastname = [dictResponse objectForKey:@"lastname"];
        [RPAccount sharedInstance].username = [dictResponse objectForKey:@"username"];
        [RPAccount sharedInstance].roleId = [dictResponse objectForKey:@"roldId"];
        [RPAccount sharedInstance].loginId = [dictResponse objectForKey:@"loginId"];
        [RPAccount sharedInstance].domainId = [dictResponse objectForKey:@"domainId"];
        [RPAccount sharedInstance].email = [dictResponse objectForKey:@"email"];
        [RPAccount sharedInstance].status = [dictResponse objectForKey:@"status"];
        
        /*
        // for API 1
        if ([responseObject isEqual:nil]){
            [self showAlertTips:@"Connection Problem"];
            [txtUserName becomeFirstResponder];
            return ;
        }
        
        [RPAccount sharedInstance].authToken = [responseObject objectForKey:@"authToken"];
        [RPAccount sharedInstance].firstname = [responseObject objectForKey:@"firstname"];
        [RPAccount sharedInstance].lastname = [responseObject objectForKey:@"lastname"];
        [RPAccount sharedInstance].username = [responseObject objectForKey:@"username"];
        [RPAccount sharedInstance].roleId = [responseObject objectForKey:@"roldId"];
        [RPAccount sharedInstance].loginId = [responseObject objectForKey:@"loginId"];
        [RPAccount sharedInstance].domainId = [responseObject objectForKey:@"domainId"];
        [RPAccount sharedInstance].email = [responseObject objectForKey:@"email"];
        [RPAccount sharedInstance].status = [responseObject objectForKey:@"status"];
        */
        
        // Check if Active
        if ([[RPAccount sharedInstance].status isEqualToString:@"Active"])
        {
            [[RPAccount sharedInstance] saveLastLogin];
            
            //goto Dashboard page
            
            id delegate = [UIApplication sharedApplication].delegate;
            if ([delegate respondsToSelector:@selector(initializeMenu)]) {
                [delegate performSelector:@selector(initializeMenu) withObject:nil];
            }
        }
        else
        {
            //goto Inactive page
        }
        
    };
    
    void (^failture)(NSError* error) = ^(NSError* error){
        //stop loading animation
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
        //Error;
        [self showAlertTips:@"Internet Connection Error!"];
    };
    
    [self signIn:txtUserName.text password:txtPassword.text successed:successed failure:failture];
}

- (IBAction)onCreateOneClicked:(UIButton *)sender
{
    NSLog(@"Goto SingUp view");
    
    RPSignUpVC *signupVC;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        signupVC = [[RPSignUpVC alloc] initWithNibName:@"RPSignUpVC" bundle:nil];
    } else {
        signupVC = [[RPSignUpVC alloc] initWithNibName:@"RPSignUpVC-iPad" bundle:nil];
    }
    
    [self.navigationController pushViewController:signupVC animated:YES];
}

- (IBAction)onForgotPasswordClicked:(UIButton *)sender {
    NSLog(@"Goto Reset view");
    
    RPResetVC *resetVC;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        resetVC = [[RPResetVC alloc] initWithNibName:@"RPResetVC" bundle:nil];
    } else {
        resetVC = [[RPResetVC alloc] initWithNibName:@"RPResetVC-iPad" bundle:nil];
    }
    
    [self.navigationController pushViewController:resetVC animated:YES];
}

#pragma mark - Alert Tips
- (void) showAlertTips : (NSString*) message
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alertView show];
}

#pragma mark - Check
- (BOOL) checkBlankField
{
    NSArray* arrayField = [NSArray arrayWithObjects:txtUserName, txtPassword, nil];
    NSArray* arrayTitle = [NSArray arrayWithObjects:@"Username", @"Password", nil];
    
    UITextField* textField = nil;
    NSString* textTitle = nil;
    
    NSInteger nInx =0;
    NSInteger nCnt =0;
    
    for(nInx = 0, nCnt = [arrayField count]; nInx<nCnt; nInx++)
    {
        textField = [arrayField objectAtIndex:nInx];
        textTitle = [arrayTitle objectAtIndex:nInx];
        
        if([textField.text isEqualToString:@""])
        {
            [self showAlertTips:[NSString stringWithFormat:@"%@ field is required.", textTitle]];
            [textField becomeFirstResponder];
            return NO;
        }
    }
    
    return YES;
}

- (void) setResignFirstResponder:(UITextField *)tf
{
    if(tf.isFirstResponder)
    {
        [tf resignFirstResponder];
    }
}


- (void) signIn:(NSString *)userName password:(NSString *)password successed:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = @{@"username": userName,
                             @"password": password };
    [[RPWebAPI sharedInstance] requestPOST:wsURL_SignIn params:params success:success failture:failure];
}

@end
