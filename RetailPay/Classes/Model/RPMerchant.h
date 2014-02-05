//
//  RPMerchant.h
//  RetailPay
//
//  Created by Administrator on 2/4/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPMerchant : NSObject

/*
@property (nonatomic, retain) NSString *createdBy;
@property (nonatomic, retain) NSString *createdOn;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *contactId;
@property (nonatomic, retain) NSString *contactFirstName;
@property (nonatomic, retain) NSString *contactLastName;
@property (nonatomic, retain) NSString *contactEmail;
@property (nonatomic, retain) NSString *contactFullName;
@property (nonatomic, retain) NSString *merchantId;
@property (nonatomic, retain) NSString *merchantCode;
@property (nonatomic, retain) NSString *merchantName;
@property (nonatomic, retain) NSString *domainId;
@property (nonatomic, retain) NSString *merchantBankId;
@property (nonatomic, retain) NSString *merchantBankStr;
@property (nonatomic, retain) NSString *industryId;
@property (nonatomic, retain) NSString *regType;
*/

@property (nonatomic, retain) NSString *contactAddressLine1;
@property (nonatomic, retain) NSString *contactAddressLine2;
@property (nonatomic, retain) NSString *contactCity;
@property (nonatomic, retain) NSString *contactCountry;
@property (nonatomic, retain) NSString *contactEmail;
@property (nonatomic, retain) NSString *contactFax;
@property (nonatomic, retain) NSString *contactFirstName;
@property (nonatomic, retain) NSString *contactFullAddress;
@property (nonatomic, retain) NSString *contactFullName;
@property (nonatomic, retain) NSString *contactId;
@property (nonatomic, retain) NSString *contactJobTitle;
@property (nonatomic, retain) NSString *contactLastName;
@property (nonatomic, retain) NSString *contactMiddleName;
@property (nonatomic, retain) NSString *contactMobilePhone;
@property (nonatomic, retain) NSString *contactPhone;
@property (nonatomic, retain) NSString *contactPostalCode;
@property (nonatomic, retain) NSString *contactState;
@property (nonatomic, retain) NSString *createdBy;
@property (nonatomic, retain) NSString *createdOn;
@property (nonatomic, retain) NSString *domainId;
@property (nonatomic, retain) NSString *industryId;
@property (nonatomic, retain) NSString *lastUpdatedBy;
@property (nonatomic, retain) NSString *lastUpdatedOn;
@property (nonatomic, retain) NSString *merchantBankId;
@property (nonatomic, retain) NSString *merchantBankStr;
@property (nonatomic, retain) NSString *merchantCode;
@property (nonatomic, retain) NSNumber *merchantId;
@property (nonatomic, retain) NSString *merchantName;
@property (nonatomic, retain) NSString *merchantRegCode;
@property (nonatomic, retain) NSString *status;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
