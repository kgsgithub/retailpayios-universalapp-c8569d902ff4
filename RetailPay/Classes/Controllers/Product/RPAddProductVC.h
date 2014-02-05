//
//  RPAddProductVC.h
//  RetailPay
//
//  Created by lion on 2/2/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPAddProductVC : UIViewController<UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
{
    UITextField *activeTxt;
    UIPickerView *pickerView;
}
@property (weak, nonatomic) IBOutlet UITextField *txtProductCategory;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *txtProductName;
@property (weak, nonatomic) IBOutlet UITextField *txtCostPrice;
@property (weak, nonatomic) IBOutlet UITextField *txtOverHead;
@property (weak, nonatomic) IBOutlet UITextField *txtClassification;
@property (weak, nonatomic) IBOutlet UITextField *txtGrade;
@property (weak, nonatomic) IBOutlet UITextField *txtTotalCost;
@property (weak, nonatomic) IBOutlet UITextField *txtMarkup;
@property (weak, nonatomic) IBOutlet UITextField *txtSellingPrice;
@property (weak, nonatomic) IBOutlet UITextField *txtQuantity;

- (IBAction)onProductCategorySelected:(UIButton *)sender;
- (IBAction)onBackClicked:(UIButton *)sender;
- (IBAction)onSaveClicked:(UIButton *)sender;
- (IBAction)onMoreClicked:(UIButton *)sender;
- (IBAction)onCancelClicked:(UIButton *)sender;

@end
