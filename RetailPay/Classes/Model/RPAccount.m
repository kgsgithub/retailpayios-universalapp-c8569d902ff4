//
//  RPAccount.m
//  RetailPay
//
//  Created by lion on 2/3/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPAccount.h"

@implementation RPAccount

+ (RPAccount *)sharedInstance {
    
    static RPAccount *defaultInstance;
    static dispatch_once_t done;
    dispatch_once(&done, ^{
        defaultInstance = [[RPAccount alloc] init];
       
    });
    return defaultInstance;
}

- (void)loadLastLogin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.loginId    = [defaults objectForKey:@"loginId"];
    self.domainId   = [defaults objectForKey:@"domainId"];
    self.roleId     = [defaults objectForKey:@"roleId"];
    self.authToken  = [defaults objectForKey:@"authToken"];
    self.username   = [defaults objectForKey:@"username"];
    self.firstname  = [defaults objectForKey:@"firstname"];
    self.lastname   = [defaults objectForKey:@"lastname"];
    self.email      = [defaults objectForKey:@"email"];
}

- (void)saveLastLogin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.loginId    forKey:@"loginId"];
    [defaults setObject:self.domainId   forKey:@"domainId"];
    [defaults setObject:self.roleId     forKey:@"roleId"];
    [defaults setObject:self.authToken  forKey:@"authToken"];
    [defaults setObject:self.username   forKey:@"username"];
    [defaults setObject:self.firstname  forKey:@"firstname"];
    [defaults setObject:self.lastname   forKey:@"lastname"];
    [defaults setObject:self.email      forKey:@"email"];
    [defaults synchronize];
}

- (void)clear {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:nil     forKey:@"loginId"];
    [defaults setObject:nil     forKey:@"domainId"];
    [defaults setObject:nil     forKey:@"roleId"];
    [defaults setObject:nil     forKey:@"authToken"];
    [defaults setObject:nil     forKey:@"username"];
    [defaults setObject:nil     forKey:@"firstname"];
    [defaults setObject:nil     forKey:@"lastname"];
    [defaults setObject:nil     forKey:@"email"];
    [defaults synchronize];
    
    [self loadLastLogin];
}

@end
