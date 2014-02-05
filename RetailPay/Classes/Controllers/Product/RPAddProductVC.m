//
//  RPAddProductVC.m
//  RetailPay
//
//  Created by lion on 2/2/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPAddProductVC.h"
#import "RPAddProductMoreVC.h"

@interface RPAddProductVC ()

@end

@implementation RPAddProductVC

@synthesize txtProductCategory;
@synthesize txtProductName;
@synthesize txtCostPrice;
@synthesize txtOverHead;
@synthesize txtClassification;
@synthesize txtGrade;
@synthesize txtTotalCost;
@synthesize txtMarkup;
@synthesize txtSellingPrice;
@synthesize txtQuantity;

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
    
    //init scrollview
    [self.scrollView setContentSize:CGSizeMake(320, 550)];
    
    //Add comboBox for product category.
//    NSArray *comboBoxDataSource =[[NSArray alloc] initWithObjects:@"one", @"two", @"three", @"four", @"five", @"six", nil];
//    _comboBox = [[ComboBoxView alloc] initWithFrame:CGRectMake(20, 100, 280, 140)];
//    _comboBox.comboBoxDatasource = comboBoxDataSource;
//    _comboBox.backgroundColor = [UIColor clearColor];
//    [_comboBox setContent:[comboBoxDataSource objectAtIndex:0]];
//    [self.view addSubview:_comboBox];
}

- (void) viewWillAppear:(BOOL)animated
{
    [self setTextFieldBorder:txtProductCategory];
    [self setTextFieldBorder:txtProductName];
    [self setTextFieldBorder:txtCostPrice];
    [self setTextFieldBorder:txtOverHead];
    [self setTextFieldBorder:txtClassification];
    [self setTextFieldBorder:txtGrade];
    [self setTextFieldBorder:txtTotalCost];
    [self setTextFieldBorder:txtMarkup];
    [self setTextFieldBorder:txtSellingPrice];
    [self setTextFieldBorder:txtQuantity];
}

- (void) setTextFieldBorder:(UITextField*)tf
{
    tf.layer.cornerRadius = 5.0f;
    tf.layer.masksToBounds = YES;
    tf.layer.borderColor=[[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0]CGColor];
    tf.layer.borderWidth = 1.0f;
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onProductCategorySelected:(UIButton *)sender
{
//    pickerView = [[UIPickerView alloc] init];
//    pickerView.showsSelectionIndicator = YES;
//    pickerView.dataSource = self;
//    pickerView.delegate = self;
//    
//    UIToolbar* toolbar = [[UIToolbar alloc] init];
//    toolbar.barStyle = UIBarStyleBlackTranslucent;
//    [toolbar sizeToFit];
//    
//    //to make the done button aligned to the right
//    UIBarButtonItem *flexibleSpaceLeft = [[UIBarButtonItem alloc]
//                                          initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//    
//    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
//                                                                   style:UIBarButtonItemStyleDone target:self
//                                                                  action:@selector(doneClicked:)];
//    
//    [toolbar setItems:[NSArray arrayWithObjects:flexibleSpaceLeft, doneButton, nil]];
//    
//    //custom input view
//    self.txtProductCategory.inputView = pickerView;
//    self.txtProductCategory.inputAccessoryView = toolbar;

}

- (IBAction)onBackClicked:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onSaveClicked:(UIButton *)sender
{
    
}

- (IBAction)onMoreClicked:(UIButton *)sender
{
    NSLog(@"Goto Add product more detail view");
    
    RPAddProductMoreVC *addProductMoreVC;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        addProductMoreVC = [[RPAddProductMoreVC alloc] initWithNibName:@"RPAddProductMoreVC" bundle:nil];
    } else {
        addProductMoreVC = [[RPAddProductMoreVC alloc] initWithNibName:@"RPAddProductMoreVC-iPad" bundle:nil];
    }
    
    [self.navigationController pushViewController:addProductMoreVC animated:YES];
}

- (IBAction)onCancelClicked:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)doneClicked:(id)sender
{
    [self.txtProductCategory resignFirstResponder]; //hides the pickerView
}

@end
