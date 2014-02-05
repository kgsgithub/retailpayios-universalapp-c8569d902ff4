//
//  RPSideMenuVC.m
//  RetailPay
//
//  Created by Administrator on 2/2/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPSideMenuVC.h"
#import "UIViewController+REFrostedViewController.h"
#import "RPDashBoardVC.h"
#import "RPAddProductVC.h"
#import "RPShareProductsVC.h"
#import "RPAccountVC.h"

@interface RPSideMenuVC ()

@end

@implementation RPSideMenuVC

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
    
    if (IS_IOS_7) {
        CGRect frame = _tableView.frame;
        frame.origin.y = 20;
        frame.size.height -= 20;
        _tableView.frame = frame;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NavigationCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.frame = CGRectMake(0, 0, cell.frame.size.width, 50);
        
        if (indexPath.section == 0) {
            // Tag Image
            NSArray *images = @[@"navigation_dashboard_icon.png", @"navigation_sell_icon.png", @"navigation_products_icon.png", @"navigation_reports_icon.png", @"navigation_customer_icon.png", @"navigation_profile_icon.png", @"navigation_utility_icon.png", @"navigation_help_icon.png", @"navigation_account_icon.png"];
            
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 31, 31)];
            imgView.center = CGPointMake(30, cell.center.y);
            imgView.image = [UIImage imageNamed:images[indexPath.row]];
            [cell addSubview:imgView];
            
            // Label
            NSArray *titles = @[@"Dashboard", @"Sell", @"Products", @"Reports", @"Customer", @"Profile", @"Utilities", @"Help", @"Account"];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, 97, cell.frame.size.height)];
            label.text = titles[indexPath.row];
            label.textColor = [UIColor darkGrayColor];
            label.font = [UIFont systemFontOfSize:13.0];
            [cell addSubview:label];
            
            // Seperator
            UIImageView *seperator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigation_seperator.png"]];
            seperator.frame = CGRectMake(0, cell.frame.size.height - 1, cell.frame.size.width, 1);
            [cell addSubview:seperator];
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 1:     // Sell
            break;
        case 2:     // Products
            [self loadAddProductVC];
            break;
        case 3:     // Reports
            break;
        case 4:     // Customer
            break;
        case 5:     // Profile
            break;
        case 6:     // Utilities
            break;
        case 7:     // Help
            break;
        case 8:     // Account
            [self loadAccountVC];
            break;
        default:    // Dashboard
            [self loadDashboard];
            break;
    }
}

#pragma mark - For Modules
- (void)loadDashboard
{
    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;
    navigationController.viewControllers = @[[[RPDashBoardVC alloc] initWithNibName:@"RPDashBoardVC" bundle:nil]];
    navigationController.navigationBarHidden = YES;
    [self.frostedViewController hideMenuViewController];
}

- (void)loadAddProductVC
{
    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;
    navigationController.viewControllers = @[[[RPAddProductVC alloc] initWithNibName:@"RPAddProductVC" bundle:nil]];
    navigationController.navigationBarHidden = YES;
    [self.frostedViewController hideMenuViewController];
}

- (void)loadShareProductsVC
{
    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;
    navigationController.viewControllers = @[[[RPShareProductsVC alloc] initWithNibName:@"RPShareProductsVC" bundle:nil]];
    navigationController.navigationBarHidden = YES;
    [self.frostedViewController hideMenuViewController];
}

- (void)loadAccountVC
{
    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;
    navigationController.viewControllers = @[[[RPAccountVC alloc] initWithNibName:@"RPAccountVC" bundle:nil]];
    navigationController.navigationBarHidden = YES;
    [self.frostedViewController hideMenuViewController];
}

@end
