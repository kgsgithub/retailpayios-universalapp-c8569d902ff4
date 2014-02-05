//
//  RPSyncContactVC.h
//  RetailPay
//
//  Created by Administrator on 2/4/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPSyncContactVC : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

- (IBAction)back:(id)sender;

@end
