//
//  RPAddProductMoreVC.h
//  RetailPay
//
//  Created by lion on 2/2/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPAddProductMoreVC : UIViewController<UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate>
{
    UITextField *activeTxt;
}

- (IBAction)onShowNavigationClicked:(id)sender;
- (IBAction)onBackClicked:(UIButton *)sender;
- (IBAction)onSaveClicked:(UIButton *)sender;
- (IBAction)onMoreClicked:(UIButton *)sender;
- (IBAction)onCancelClicked:(UIButton *)sender;
- (IBAction)onSelectFileClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *txtSelectFile;
@property (weak, nonatomic) IBOutlet UITextView *tvDescription;
@property (weak, nonatomic) IBOutlet UITextField *txtLevel;

@end
