//
//  RPSignUpVC.h
//  RetailPay
//
//  Created by lion on 2/1/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPSignUpVC : UIViewController<UITextFieldDelegate>
{
    UITextField *activeTxt;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *txtBusinessName;
@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtTelephone;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtReferralCode;

- (IBAction)onSignUpClicked:(UIButton *)sender;
- (IBAction)onLoginHereClicked:(UIButton *)sender;

- (void)addMerchant:(NSString *)businessName firstName:(NSString *)firstName lastName:(NSString *)lastName telephone:(NSString *)telephone email:(NSString *)email password:(NSString *)password referralCode:(NSString *)referralCode successed:(void (^)(id))success failure:(void (^)(NSError *))failure;
- (void)addUser:(NSString *)email firstName:(NSString *)firstName lastName:(NSString *)lastName password:(NSString *)password successed:(void (^)(id))success failure:(void (^)(NSError *))failure;


@end
