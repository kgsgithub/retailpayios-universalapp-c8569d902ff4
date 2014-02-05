//
//  RPDashBoardVC.h
//  RetailPay
//
//  Created by Administrator on 1/30/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPDashBoardVC : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *scrollContentView;
@property (weak, nonatomic) IBOutlet UILabel *lblCustomerCount;
@property (weak, nonatomic) IBOutlet UILabel *lblSoldItemCount;
@property (weak, nonatomic) IBOutlet UILabel *lblCanceledItemCount;

@property (retain, nonatomic) NSMutableArray *merchants;

- (IBAction)showMenu:(id)sender;
- (IBAction)go2SaleChart:(id)sender;
- (IBAction)go2ProductChart:(id)sender;
- (IBAction)go2ProfitabilityChart:(id)sender;
- (IBAction)go2CustomerChart:(id)sender;

@end
