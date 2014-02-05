//
//  RPWebAPI.h
//  RetailPay
//
//  Created by Administrator on 2/1/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPAppDelegate.h"
#import "AFHTTPClient.h"

@interface RPWebAPI : NSObject

@property (nonatomic, retain) RPAppDelegate *appDelegate;
@property (nonatomic, retain) AFHTTPClient *client;


+ (RPWebAPI *)sharedInstance;

- (void)requestGET:(NSString *)path
            params:(NSDictionary *)params
           success:(void (^)(id))success
          failture:(void (^)(NSError *))failture;

- (void)requestGET:(NSString *)path
           headers:(NSDictionary *)headers
            params:(NSDictionary *)params
           success:(void (^)(id))success
          failture:(void (^)(NSError *))failture;

- (void)requestGET:(NSString *)baseURL
              path:(NSString *)path
           headers:(NSDictionary *)headers
            params:(NSDictionary *)params
           success:(void (^)(id))success
          failture:(void (^)(NSError *))failture;

- (void)requestPOST:(NSString *)path
             params:(NSDictionary *)params
            success:(void (^)(id))success
           failture:(void (^)(NSError *))failture;

- (void)requestPOST:(NSString *)path
            headers:(NSDictionary *)headers
             params:(NSDictionary *)params
            success:(void (^)(id))success
           failture:(void (^)(NSError *))failture;

- (void)requestPOST:(NSString *)baseURL
               path:(NSString *)path
            headers:(NSDictionary *)headers
             params:(NSDictionary *)params
            success:(void (^)(id))success
           failture:(void (^)(NSError *))failture;

@end
