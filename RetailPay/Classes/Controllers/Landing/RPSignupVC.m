//
//  RPSignUpVC.m
//  RetailPay
//
//  Created by lion on 2/1/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPWebAPI.h"
#import "RPSignUpVC.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "RPSignInVC.h"
#import "MBProgressHUD.h"
#import "RPDashBoardVC.h"
#import "RPSignUpSuccessVC.h"

@interface RPSignUpVC ()
{
    UITextField *activTxt;
}
@end

@implementation RPSignUpVC

@synthesize txtBusinessName;
@synthesize txtFirstName;
@synthesize txtLastName;
@synthesize txtTelephone;
@synthesize txtEmail;
@synthesize txtPassword;
@synthesize txtReferralCode;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.navigationController setNavigationBarHidden:FALSE];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"SignUp";
    [self.scrollView setContentSize:CGSizeMake(320, 570)];
}

-(void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
    
    //set username and password textfiled border.
    [self setTextFieldBorder:txtBusinessName];
    [self setTextFieldBorder:txtFirstName];
    [self setTextFieldBorder:txtLastName];
    [self setTextFieldBorder:txtTelephone];
    [self setTextFieldBorder:txtEmail];
    [self setTextFieldBorder:txtPassword];
    [self setTextFieldBorder:txtReferralCode];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setTextFieldBorder:(UITextField*)tf
{
    tf.layer.cornerRadius = 5.0f;
    tf.layer.masksToBounds = YES;
    tf.layer.borderColor=[[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0]CGColor];
    tf.layer.borderWidth = 1.0f;
}

- (IBAction)onSignUpClicked:(UIButton *)sender
{
    //check TextField
    if([self checkBlankField] == NO)
    {
        return;
    }
    
    //check Email
    if([self checkEmail] == NO)
    {
        return;
    }
    
    //check password
    if([self checkPassword] == NO)
    {
        return;
    }
    
    [self setResignFirstResponder:txtBusinessName];
    [self setResignFirstResponder:txtFirstName];
    [self setResignFirstResponder:txtLastName];
    [self setResignFirstResponder:txtTelephone];
    [self setResignFirstResponder:txtEmail];
    [self setResignFirstResponder:txtPassword];
    [self setResignFirstResponder:txtReferralCode];
 
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    //SignUp
    void (^successedAddMerchant)(id responseObject) = ^(id responseObject){
        
        void (^successedAddUser)(id responseObject) = ^(id responseObject){
            //stop animation
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            
            int responseCode = [[responseObject objectForKey:@"responseCode"] intValue];
            if(responseCode !=200)
            {
                [self showAlertTips:@"An error occured in creating new account."];
                return ;
            }

//            //JSon Parsing
//            NSDictionary *dictResponse = [responseObject objectForKey:@"resource"];
//            [RPWebAPI sharedInstance].firstname = [dictResponse objectForKey:@"firstname"];
//            [RPWebAPI sharedInstance].lastname = [dictResponse objectForKey:@"lastname"];
//            [RPWebAPI sharedInstance].username = [dictResponse objectForKey:@"username"];
//            [RPWebAPI sharedInstance].email = [dictResponse objectForKey:@"emailAddress"];
            
            RPSignUpSuccessVC *signupSuccessVC;
            if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                signupSuccessVC = [[RPSignUpSuccessVC alloc] initWithNibName:@"RPSignUpSuccessVC" bundle:nil];
            else
                signupSuccessVC = [[RPSignUpSuccessVC alloc] initWithNibName:@"RPSignUpSuccessVC-iPad" bundle:nil];
            [self.navigationController pushViewController:signupSuccessVC animated:YES];
           
        };
        
        void (^failtureAddUser)(NSError* error) = ^(NSError* error){
            //stop loading animation
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            
            //Error;
            [self showAlertTips:@"Internet Connection Error!"];
        };
        
        [self addUser:txtEmail.text firstName:txtFirstName.text lastName:txtLastName.text password:txtPassword.text successed:successedAddUser failure:failtureAddUser];
        
        
    };
    
    void (^failtureAddMerchant)(NSError* error) = ^(NSError* error){
        //stop loading animation
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
        //Error;
        [self showAlertTips:@"Internet Connection Error!"];
    };

    [self addMerchant:txtBusinessName.text
                firstName:txtFirstName.text
                lastName:txtLastName.text
                telephone:txtTelephone.text
                email:txtEmail.text
                password:txtPassword.text
                referralCode:txtReferralCode.text
                successed:successedAddMerchant
                failure:failtureAddMerchant ];
}

- (IBAction)onLoginHereClicked:(UIButton *)sender
{
    RPSignInVC *signinVC;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        signinVC = [[RPSignInVC alloc] initWithNibName:@"RPSignInVC" bundle:nil];
    } else {
        signinVC = [[RPSignInVC alloc] initWithNibName:@"RPSignInVC-iPad" bundle:nil];
    }
    
    [self.navigationController pushViewController:signinVC animated:YES];
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    activeTxt = textField;
}

-(void) textFieldDidEndEditing:(UITextField *)textField
{
    activeTxt = nil;
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
    NSArray* arrayField = [NSArray arrayWithObjects:self.txtBusinessName,
                                                    self.txtFirstName,
                                                    self.txtLastName,
                                                    self.txtTelephone,
                                                    self.txtEmail,
                                                    self.txtPassword,
                                                    self.txtReferralCode, nil];
    NSArray* arrayTitle = [NSArray arrayWithObjects:@"BusinessName", @"FirstName", @"LastName", @"Telephone", @"Email", @"Password", @"ReferralCode", nil];
    
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

-(BOOL) checkPassword
{
    NSString*       passwordRegex = @"[A-Z0-9a-z]+" ;
    NSPredicate*    passwordTest = [ NSPredicate predicateWithFormat : @"SELF MATCHES %@", passwordRegex ] ;
    
    if( [ passwordTest evaluateWithObject : txtPassword.text ] == NO )
    {
        [ self showAlertTips : @"Invalid Password." ] ;
        return NO ;
    }
    
    return YES ;
}

- (BOOL) checkEmail
{
    NSString*       emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" ;
    NSPredicate*    emailTest = [ NSPredicate predicateWithFormat : @"SELF MATCHES %@", emailRegex ] ;
    
    if( [ emailTest evaluateWithObject : txtEmail.text ] == NO )
    {
        [ self showAlertTips : @"Invalid Email address." ] ;
        return NO ;
    }
    
    return YES ;
}

- (void) setResignFirstResponder:(UITextField *)tf
{
    if(tf.isFirstResponder)
    {
        [tf resignFirstResponder];
    }
}

- (void)addMerchant:(NSString *)businessName firstName:(NSString *)firstName lastName:(NSString *)lastName telephone:(NSString *)telephone email:(NSString *)email password:(NSString *)password referralCode:(NSString *)referralCode successed:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = @{@"merchantId": @"10000",
                             @"merchantCode": @"",
                             @"merchantName": businessName,
                             @"parentMerchantCode": referralCode,
                             @"industryId": @"15",
                             @"regType": @"RTM_USER",
                             @"contactFirstName": firstName,
                             @"contactLastName": lastName,
                             @"contactEmail": email,
                             @"contactFullName": [NSString stringWithFormat:@"%@ %@",firstName, lastName ],
                             @"status": @"New"
                             };
    [[RPWebAPI sharedInstance] requestPOST:wsURL_AddMerchant params:params success:success failture:failure];
}

- (void)addUser:(NSString *)email firstName:(NSString *)firstName lastName:(NSString *)lastName password:(NSString *)password successed:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = @{@"username": email,
                             @"createdBy": email,
                             @"password": password,
                             @"firstname": firstName,
                             @"lastname": lastName,
                             @"emailAddress": email,
                             @"address": @"-",
                             @"city": @"-",
                             @"state": @"-",
                             @"country": @"-"
                             };
    [[RPWebAPI sharedInstance] requestPOST:wsURL_AddUser params:params success:success failture:failure];
}
@end
