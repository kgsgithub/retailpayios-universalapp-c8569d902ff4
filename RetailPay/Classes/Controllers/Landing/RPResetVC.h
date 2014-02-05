//
//  RPResetVC.h
//  RetailPay
//
//  Created by lion on 2/2/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RPResetVC : UIViewController<UITextFieldDelegate>

- (IBAction)onResetClicked:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;

@end
