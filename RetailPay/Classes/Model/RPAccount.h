//
//  RPAccount.h
//  RetailPay
//
//  Created by lion on 2/3/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPAccount : NSObject

+ (RPAccount *)sharedInstance;

/* Login Data */
@property (nonatomic, retain) NSString *loginId;
@property (nonatomic, retain) NSString *domainId;
@property (nonatomic, retain) NSString *roleId;
@property (nonatomic, retain) NSString *authToken;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *firstname;
@property (nonatomic, retain) NSString *lastname;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *status;

- (void)loadLastLogin;
- (void)saveLastLogin;
- (void)clear;

@end
