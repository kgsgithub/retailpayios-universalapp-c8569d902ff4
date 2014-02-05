//
//  RPUtils.m
//  RetailPay
//
//  Created by Administrator on 2/4/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPUtils.h"

@implementation RPUtils

+ (void)showAlert:(id)delegate content:(NSString *)message
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:message delegate:delegate cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alertView show];
}

@end
