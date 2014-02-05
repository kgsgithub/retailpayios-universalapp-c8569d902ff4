//
//  RPDashBoardVC.m
//  RetailPay
//
//  Created by Administrator on 1/30/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPDashBoardVC.h"
#import "RPNavigationController.h"
#import "RPSaleChartVC.h"
#import "RPUtils.h"
#import "RPMerchant.h"

@interface RPDashBoardVC ()

@end

@implementation RPDashBoardVC

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

    self.navigationController.navigationBarHidden = YES;
    _scrollView.contentSize = _scrollContentView.frame.size;
    
    self.merchants = [[NSMutableArray alloc] init];

    // Firstly, get merchant Id..
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self getMerchants];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMenu:(id)sender {
    RPNavigationController *navController = (RPNavigationController *)self.navigationController;
    [navController showMenu];
}

- (IBAction)go2SaleChart:(id)sender {
    RPSaleChartVC *vc = [[RPSaleChartVC alloc] initWithNibName:@"RPSaleChartVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)go2ProductChart:(id)sender {
}

- (IBAction)go2ProfitabilityChart:(id)sender {
}

- (IBAction)go2CustomerChart:(id)sender {
}

#pragma mark - Data

- (void)getMerchants
{
    if (![RPAccount sharedInstance].authToken) {
        NSLog(@"RPDashBoardVC - Auth token not found!");
        return;
    }
    
    NSDictionary *headers = @{@"UserAuthorization": [RPAccount sharedInstance].authToken};
    
    [[RPWebAPI sharedInstance] requestGET:wsAPIBase_v1
                                     path:@"merchants.json"
                                  headers:headers
                                   params:nil
                                  success:^(id responseObject) {

                                      // Parse Data
                                      if ([responseObject isKindOfClass:[NSArray class]]) {
                                          
                                          NSArray *list = responseObject;
                                          if (list && list.count > 0) {
                                              for (id dict in list) {
                                                  RPMerchant *merchant = [[RPMerchant alloc] initWithDictionary:dict];
                                                  [_merchants addObject:merchant];
                                              }
                                          }
                                          
                                      } else if ([responseObject isKindOfClass:[NSDictionary class]]) {
                                          
                                          RPMerchant *merchant = [[RPMerchant alloc] initWithDictionary:responseObject];
                                          [_merchants addObject:merchant];
                                      }
                                      
                                      
                                      if (_merchants.count > 0) {
                                          
                                          // Continue for Customers
                                          [self getCustomers];
                                          
                                      } else {
                                          
                                          [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                                          [RPUtils showAlert:self content:@"Can't get merchant information."];
                                      }
                                      
                                      
                                  } failture:^(NSError *error) {
                                      
                                      [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                                      [RPUtils showAlert:self content:@"Can't get merchant information."];
                                  }];
}

- (void)getCustomers
{
    // Get Merchant Id
    NSNumber *merchantId = nil;
    for (RPMerchant *merchant in _merchants) {
        if (merchant.merchantId && [merchant.merchantId intValue] > 0) {
            merchantId = merchant.merchantId;
            break;
        }
    }
    
    if (!merchantId)
        return;
    
    NSDictionary *params = @{@"merchantId": merchantId};
    
    [[RPWebAPI sharedInstance] requestGET:wsAPIBase_v1
                                     path:@"customers/count.json"
                                  headers:nil
                                   params:params
                                  success:^(id responseObject) {
                                      
                                      // Parse Data
                                      if ([responseObject isKindOfClass:[NSArray class]]) {
                                          
                                          NSArray *list = responseObject;
                                          if (list && list.count > 0) {
                                              for (id dict in list) {
                                                  RPMerchant *merchant = [[RPMerchant alloc] initWithDictionary:dict];
                                                  [_merchants addObject:merchant];
                                              }
                                          }
                                          
                                      } else if ([responseObject isKindOfClass:[NSDictionary class]]) {
                                          
                                          RPMerchant *merchant = [[RPMerchant alloc] initWithDictionary:responseObject];
                                          [_merchants addObject:merchant];
                                      }
                                      
                                      
                                      if (_merchants.count > 0) {
                                          
                                          // Continue for Customers
                                          [self getCustomers];
                                          
                                      } else {
                                          
                                          [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                                          [RPUtils showAlert:self content:@"Can't get customer information."];
                                      }
                                      
                                      
                                  } failture:^(NSError *error) {
                                      
                                      [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                                      [RPUtils showAlert:self content:@"Can't get customer information."];
                                  }];
}

@end
