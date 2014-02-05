//
//  RPResetVC.m
//  RetailPay
//
//  Created by lion on 2/2/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPResetVC.h"
#import "MBProgressHUD.h"

@interface RPResetVC ()

@end

@implementation RPResetVC

@synthesize txtEmail;

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
    self.title = @"Reset";
    [self setTextFieldBorder:txtEmail];
//    [self.scrollView setContentSize:CGSizeMake(320, 570)];
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
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

- (IBAction)onResetClicked:(UIButton *)sender
{
    //check usernamd and value
    if([self checkBlankField] == NO)
    {
        return;
    }
    
    // username
    if( [ txtEmail isFirstResponder ] )
    {
        [ txtEmail resignFirstResponder ] ;
    }
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    void(^successed)(id responseObject) = ^(id responseObject) {
        //stop loading animation
        [MBProgressHUD hideHUDForView : self.view animated:YES];
        
        int responseCode = [[responseObject objectForKey:@"responseCode"] intValue];
        if(responseCode !=200)
        {
            [self showAlertTips:@"Username or password is incorrect."];
            
            return ;
        }
        
        if([responseObject isEqual:nil]){
            [self showAlertTips:@"Connection Problem"];
            return ;
        }
        
//        //goto Dashboard page
//        RPDashBoardVC *dashboardVC;
//        if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
//            dashboardVC = [[RPDashBoardVC alloc] initWithNibName:@"RPDashBoardVC" bundle:nil];
//        else
//            dashboardVC = [[RPDashBoardVC alloc] initWithNibName:@"RPDashBoardVC-iPad" bundle:nil];
//        [self.navigationController pushViewController:dashboardVC animated:YES];
        
    };
    
    void (^failture)(NSError* error) = ^(NSError* error){
        //stop loading animation
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
        //Error;
        [self showAlertTips:@"Internet Connection Error!"];
    };
    
    [self resetPassword:txtEmail.text successed:successed failure:failture];
}

- (void) resetPassword:(NSString *)email successed:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = @{@"uid": email};
    [[RPWebAPI sharedInstance] requestGET:wsURL_ResetPassword params:params success:success failture:failure];
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Alert Tips
- (void) showAlertTips : (NSString*) message
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alertView show];
}


- (BOOL) checkBlankField
{
    if([txtEmail.text isEqualToString:@""])
    {
        [self showAlertTips:[NSString stringWithFormat:@"%@ field is required.", txtEmail.text]];
        [txtEmail becomeFirstResponder];
        return NO;
    }
    
    return YES;
}
@end
