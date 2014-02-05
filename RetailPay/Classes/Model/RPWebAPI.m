//
//  RPWebAPI.m
//  RetailPay
//
//  Created by Administrator on 2/1/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPWebAPI.h"
#import "NSString+SBJSON.h"
#import "AFJSONRequestOperation.h"
#import "AFNetworkActivityIndicatorManager.h"


int const kTimeout = 30;

@implementation RPWebAPI

@synthesize client;

#pragma mark - Shared Functions
+ (RPWebAPI *)sharedInstance {
    
    static RPWebAPI *defaultInstance;
    static dispatch_once_t done;
    dispatch_once(&done, ^{
        defaultInstance = [[RPWebAPI alloc] init];
        defaultInstance.appDelegate = (RPAppDelegate *)[[UIApplication sharedApplication] delegate];
    });
    return defaultInstance;
}


#pragma mark - GET

- (void)requestGET:(NSString *)path
            params:(NSDictionary *)params
           success:(void (^)(id))success
          failture:(void (^)(NSError *))failture
{
    client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:wsURL_APIBase]];
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [client setParameterEncoding:AFJSONParameterEncoding];
    [client setDefaultHeader:@"Authorization" value: AUTHORIZATION_KEY];
    [client setDefaultHeader:@"Content-Type" value:@"application/json"];
    [client setDefaultHeader:@"Accept" value:@"application/json"];
    
    [client getPath:path
         parameters:params
            success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@", responseObject);
         if(success)
         {
             success(responseObject);
         }
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@", error);
         if(failture)
         {
             failture(error);
         }
     }];
}

- (void)requestGET:(NSString *)path
           headers:(NSDictionary *)headers
            params:(NSDictionary *)params
           success:(void (^)(id))success
          failture:(void (^)(NSError *))failture
{
    client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:wsURL_APIBase]];
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [client setParameterEncoding:AFJSONParameterEncoding];
    [client setDefaultHeader:@"Authorization" value: AUTHORIZATION_KEY];
    [client setDefaultHeader:@"Content-Type" value:@"application/json"];
    [client setDefaultHeader:@"Accept" value:@"application/json"];
    
    if (headers && [headers count] > 0) {
        NSArray *keys = [headers allKeys];
        for (NSString *key in keys) {
            [client setDefaultHeader:key value:[headers objectForKey:key]];
        }
    }
    
    [client getPath:path
         parameters:params
            success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@", responseObject);
         if(success)
         {
             success(responseObject);
         }
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@", error);
         if(failture)
         {
             failture(error);
         }
     }];
}

- (void)requestGET:(NSString *)baseURL
              path:(NSString *)path
           headers:(NSDictionary *)headers
            params:(NSDictionary *)params
           success:(void (^)(id))success
          failture:(void (^)(NSError *))failture
{
    client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [client setParameterEncoding:AFJSONParameterEncoding];
    [client setDefaultHeader:@"Authorization" value: AUTHORIZATION_KEY];
    [client setDefaultHeader:@"Content-Type" value:@"application/json"];
    [client setDefaultHeader:@"Accept" value:@"application/json"];
    
    if (headers && [headers count] > 0) {
        NSArray *keys = [headers allKeys];
        for (NSString *key in keys) {
            [client setDefaultHeader:key value:[headers objectForKey:key]];
        }
    }
    
    [client getPath:path
         parameters:params
            success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@", responseObject);
         if(success)
         {
             success(responseObject);
         }
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@", error);
         if(failture)
         {
             failture(error);
         }
     }];
}

#pragma mark - POST

- (void)requestPOST:(NSString *)path
             params:(NSDictionary *)params
            success:(void (^)(id))success
           failture:(void (^)(NSError *))failture
{
    client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:wsURL_APIBase]];
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [client setParameterEncoding:AFJSONParameterEncoding];
    [client setDefaultHeader:@"Authorization" value: AUTHORIZATION_KEY];
    [client setDefaultHeader:@"Content-Type" value:@"application/json"];
    [client setDefaultHeader:@"Accept" value:@"application/json"];
    
    [client postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@", responseObject);
         if (success)
         {
             success(responseObject);
         }
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@", error);
         if (failture)
         {
             failture(error);
         }
     }];
}

- (void)requestPOST:(NSString *)path
            headers:(NSDictionary *)headers
             params:(NSDictionary *)params
            success:(void (^)(id))success
           failture:(void (^)(NSError *))failture
{
    client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:wsURL_APIBase]];
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [client setParameterEncoding:AFJSONParameterEncoding];
    [client setDefaultHeader:@"Authorization" value: AUTHORIZATION_KEY];
    [client setDefaultHeader:@"Content-Type" value:@"application/json"];
    [client setDefaultHeader:@"Accept" value:@"application/json"];
    
    if (headers && [headers count] > 0) {
        NSArray *keys = [headers allKeys];
        for (NSString *key in keys) {
            [client setDefaultHeader:key value:[headers objectForKey:key]];
        }
    }
    
    [client postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@", responseObject);
         if (success)
         {
             success(responseObject);
         }
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@", error);
         if (failture)
         {
             failture(error);
         }
     }];
}

- (void)requestPOST:(NSString *)baseURL
               path:(NSString *)path
            headers:(NSDictionary *)headers
             params:(NSDictionary *)params
            success:(void (^)(id))success
           failture:(void (^)(NSError *))failture
{
    client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [client setParameterEncoding:AFJSONParameterEncoding];
    [client setDefaultHeader:@"Authorization" value: AUTHORIZATION_KEY];
    [client setDefaultHeader:@"Content-Type" value:@"application/json"];
    [client setDefaultHeader:@"Accept" value:@"application/json"];
    
    if (headers && [headers count] > 0) {
        NSArray *keys = [headers allKeys];
        for (NSString *key in keys) {
            [client setDefaultHeader:key value:[headers objectForKey:key]];
        }
    }
    
    [client postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@", responseObject);
         if (success)
         {
             success(responseObject);
         }
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@", error);
         if (failture)
         {
             failture(error);
         }
     }];
}

@end
