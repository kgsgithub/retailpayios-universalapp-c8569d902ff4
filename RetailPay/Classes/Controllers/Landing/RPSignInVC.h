//
//  RPSignInVC.h
//  RetailPay
//
//  Created by lion on 2/1/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPKeyboardAvoidingScrollView.h"

@interface RPSignInVC : UIViewController<UITextFieldDelegate>
{
    
}

//- (void) onForgotPasswordClicked:(id *) sender;
//- (void) onCreateOneClicked:(id *) sender;
- (IBAction)onSignInClicked:(UIButton *)sender;
- (IBAction)onForgotPasswordClicked:(UIButton *)sender;
- (IBAction)onCreateOneClicked:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtUserName;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
@end
