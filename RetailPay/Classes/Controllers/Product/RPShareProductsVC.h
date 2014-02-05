//
//  RPShareProductsVC.h
//  RetailPay
//
//  Created by lion on 2/2/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPKeyboardAvoidingScrollView.h"

typedef enum {
    kFacebook,
    kGoogle,
    kTwitter,
    kInstagram,
    kMessage,
    kSms
} SelectedState;

@interface RPShareProductsVC : UIViewController<UITextViewDelegate>
{
    SelectedState _selectedBtn;
}

@property (weak, nonatomic) IBOutlet UIButton *optFacebook;
@property (weak, nonatomic) IBOutlet UIButton *optGoogle;
@property (weak, nonatomic) IBOutlet UIButton *optTwitter;
@property (weak, nonatomic) IBOutlet UIButton *optInstagram;
@property (weak, nonatomic) IBOutlet UIButton *optMessage;
@property (weak, nonatomic) IBOutlet UIButton *optSms;
@property (weak, nonatomic) IBOutlet UITextView *tvMessage;
@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;

- (void) resetOptions;
- (IBAction)onFacebookClicked:(UIButton *)sender;
- (IBAction)onGoogleClicked:(UIButton *)sender;
- (IBAction)onTwitterClicked:(UIButton *)sender;
- (IBAction)onInstagramClicked:(UIButton *)sender;
- (IBAction)onMessageClicked:(UIButton *)sender;
- (IBAction)onSmsClicked:(UIButton *)sender;
- (IBAction)onBackClicked:(UIButton *)sender;
- (IBAction)onPreviewClicked:(UIButton *)sender;
- (IBAction)onShareClicked:(UIButton *)sender;
- (IBAction)onCancelClicked:(UIButton *)sender;
@end
