//
//  RPAddProductMoreVC.m
//  RetailPay
//
//  Created by lion on 2/2/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPAddProductMoreVC.h"

@interface RPAddProductMoreVC ()

@end

@implementation RPAddProductMoreVC

@synthesize txtLevel;
@synthesize txtSelectFile;
@synthesize tvDescription;

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
    [self.scrollView setContentSize:CGSizeMake(320, 500)];
    
    //for Message TextView placefolder.
    [self.tvDescription setText:@"Enter porduct description here"];
    self.tvDescription.textColor = [UIColor lightGrayColor];
}

-(void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:TRUE];
    [self setTextFieldBorder:txtLevel];
    [self setTextFieldBorder:txtSelectFile];
    
    tvDescription.layer.cornerRadius = 5.0f;
    tvDescription.layer.masksToBounds = YES;
    tvDescription.layer.borderColor=[[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0]CGColor];
    tvDescription.layer.borderWidth = 1.0f;

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

- (IBAction)onShowNavigationClicked:(id)sender {
}

- (IBAction)onBackClicked:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onSaveClicked:(UIButton *)sender {
}

- (IBAction)onMoreClicked:(UIButton *)sender {
}

- (IBAction)onCancelClicked:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onSelectFileClicked:(id)sender
{
    NSLog(@"Select Image");
    UIActionSheet *actionSheet =[[UIActionSheet alloc] initWithTitle:@"Select Product Image" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"from Album", @"from Camera", nil];
    [actionSheet setActionSheetStyle:UIActionSheetStyleDefault];
    [actionSheet showInView:self.view];
}

#pragma mark - UIActionSheet delegate

-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setDelegate:self];
    [imagePicker setAllowsEditing:YES];
    
    switch (buttonIndex) {
        case 0:
            [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            [self presentViewController:imagePicker animated:YES completion:nil];
            
            break;
            
        case 1:
            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
                [self presentViewController:imagePicker animated:YES completion:nil];
            } else {
                NSLog(@"NO CAMERA!");
            }
        default:
            break;
    }
   
}

#pragma mark - UIImagePickerController delegate

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *photo = info[UIImagePickerControllerEditedImage];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
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

#pragma mark - UITextView delegate

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

-(BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    self.tvDescription.text =@"";
    self.tvDescription.textColor = [UIColor blackColor];
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    if(self.tvDescription.text.length ==0)
    {
        self.tvDescription.textColor = [UIColor lightGrayColor];
        self.tvDescription.text = @"Enter porduct description here";
        [self.tvDescription resignFirstResponder];
    }
}

@end
