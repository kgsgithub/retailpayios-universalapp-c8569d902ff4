//
//  RPConstants.h
//  RetailPay
//
//  Created by Administrator on 1/30/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

//#define wsURL_APIBase         @"http://testservices.interswitchng.com/retailpay/api/v1"
#define wsURL_APIBase           @"http://testservices.interswitchng.com/retailpay/api/v2/"

#define wsAPIBase_v1            @"http://testservices.interswitchng.com/retailpay/api/v1/"
#define wsAPIBase_v2            @"http://testservices.interswitchng.com/retailpay/api/v2/"

#define wsURL_SignIn            @"usersession.json"
#define wsURL_AddMerchant       @"merchants.json"
#define wsURL_AddUser           @"users.json"
#define wsURL_GetMerchants      @"merchants.json"
#define wsURL_ResetPassword     @"http://172.25.20.72:8082/retailpay/api/v1/users/requestpasswordreset.json"

#define AUTHORIZATION_KEY       @"InterswitchAuth MTIzNDU2Nzg5MA=="


@interface RPConstants : NSObject
@end
