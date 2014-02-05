//
//  RPShareProductsVC.m
//  RetailPay
//
//  Created by lion on 2/2/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPShareProductsVC.h"

@interface RPShareProductsVC ()

@end

@implementation RPShareProductsVC

@synthesize tvMessage;

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
    
    //for Message TextView placefolder.
    [self.tvMessage setText:@"Enter porduct description here"];
    self.tvMessage.textColor = [UIColor lightGrayColor];
    
    [self setTextFieldBorder:tvMessage];
    [self.scrollView setContentSize:CGSizeMake(320, 450)];
}

- (void) setTextFieldBorder:(UITextView*)tv
{
    tv.layer.cornerRadius = 5.0f;
    tv.layer.masksToBounds = YES;
    tv.layer.borderColor=[[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0]CGColor];
    tv.layer.borderWidth = 1.0f;
}

-(void) resetOptions
{
    [self.optFacebook setImage:[UIImage imageNamed:@"unapply_button"] forState:UIControlStateNormal];
    [self.optGoogle setImage:[UIImage imageNamed:@"unapply_button"] forState:UIControlStateNormal];
    [self.optTwitter setImage:[UIImage imageNamed:@"unapply_button"] forState:UIControlStateNormal];
    [self.optInstagram setImage:[UIImage imageNamed:@"unapply_button"] forState:UIControlStateNormal];
    [self.optMessage setImage:[UIImage imageNamed:@"unapply_button"] forState:UIControlStateNormal];
    [self.optSms setImage:[UIImage imageNamed:@"unapply_button"] forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onFacebookClicked:(UIButton *)sender
{
    [self resetOptions];
    _selectedBtn = kFacebook;
    [self.optFacebook setImage:[UIImage imageNamed:@"selected_blueoption"] forState:UIControlStateNormal];
}

- (IBAction)onGoogleClicked:(UIButton *)sender
{
    [self resetOptions];
    _selectedBtn = kGoogle;
    [self.optGoogle setImage:[UIImage imageNamed:@"selected_blueoption"] forState:UIControlStateNormal];
}

- (IBAction)onTwitterClicked:(UIButton *)sender
{
    [self resetOptions];
    _selectedBtn = kTwitter;
    [self.optTwitter setImage:[UIImage imageNamed:@"selected_blueoption"] forState:UIControlStateNormal];
}

- (IBAction)onInstagramClicked:(UIButton *)sender
{
    [self resetOptions];
    _selectedBtn = kInstagram;
    [self.optInstagram setImage:[UIImage imageNamed:@"selected_blueoption"] forState:UIControlStateNormal];
}

- (IBAction)onMessageClicked:(UIButton *)sender
{
    [self resetOptions];
    _selectedBtn = kMessage;
    [self.optMessage setImage:[UIImage imageNamed:@"selected_blueoption"] forState:UIControlStateNormal];
}

- (IBAction)onSmsClicked:(UIButton *)sender
{
    [self resetOptions];
    _selectedBtn = kSms;
    [self.optSms setImage:[UIImage imageNamed:@"selected_blueoption"] forState:UIControlStateNormal];
}

- (IBAction)onBackClicked:(UIButton *)sender {
}

- (IBAction)onPreviewClicked:(UIButton *)sender {
}

- (IBAction)onShareClicked:(UIButton *)sender {
}

- (IBAction)onCancelClicked:(UIButton *)sender {
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
    self.tvMessage.text =@"";
    self.tvMessage.textColor = [UIColor blackColor];
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    if(self.tvMessage.text.length ==0)
    {
        self.tvMessage.textColor = [UIColor lightGrayColor];
        self.tvMessage.text = @"Enter porduct description here";
        [self.tvMessage resignFirstResponder];
    }
}

@end
