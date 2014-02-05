//
//  RPMerchant.m
//  RetailPay
//
//  Created by Administrator on 2/4/14.
//  Copyright (c) 2014 Projectangle Ltd. All rights reserved.
//

#import "RPMerchant.h"

@implementation RPMerchant

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (dictionary && ![dictionary isKindOfClass:[NSNull class]])
    {
        /*
        if ([dictionary objectForKey:@"createdBy"])
            self.createdBy = [dictionary objectForKey:@"createdBy"];
        if ([dictionary objectForKey:@"createdOn"])
            self.createdOn = [dictionary objectForKey:@"createdOn"];
        if ([dictionary objectForKey:@"status"])
            self.status = [dictionary objectForKey:@"status"];
        if ([dictionary objectForKey:@"contactId"])
            self.contactId = [dictionary objectForKey:@"contactId"];
        if ([dictionary objectForKey:@"contactFirstName"])
            self.contactFirstName = [dictionary objectForKey:@"contactFirstName"];
        if ([dictionary objectForKey:@"contactLastName"])
            self.contactLastName = [dictionary objectForKey:@"contactLastName"];
        if ([dictionary objectForKey:@"contactEmail"])
            self.contactEmail = [dictionary objectForKey:@"contactEmail"];
        if ([dictionary objectForKey:@"contactFullName"])
            self.contactFullName = [dictionary objectForKey:@"contactFullName"];
        if ([dictionary objectForKey:@"merchantId"])
            self.merchantId = [dictionary objectForKey:@"merchantId"];
        if ([dictionary objectForKey:@"merchantCode"])
            self.merchantCode = [dictionary objectForKey:@"merchantCode"];
        if ([dictionary objectForKey:@"merchantName"])
            self.merchantName = [dictionary objectForKey:@"merchantName"];
        if ([dictionary objectForKey:@"domainId"])
            self.domainId = [dictionary objectForKey:@"domainId"];
        if ([dictionary objectForKey:@"merchantBankId"])
            self.merchantBankId = [dictionary objectForKey:@"merchantBankId"];
        if ([dictionary objectForKey:@"merchantBankStr"])
            self.merchantBankStr = [dictionary objectForKey:@"merchantBankStr"];
        if ([dictionary objectForKey:@"industryId"])
            self.industryId = [dictionary objectForKey:@"industryId"];
        if ([dictionary objectForKey:@"regType"])
            self.regType = [dictionary objectForKey:@"regType"];
         */
        
        if ([dictionary objectForKey:@"contactAddressLine1"])
            self.contactAddressLine1 = [dictionary objectForKey:@"contactAddressLine1"];
        if ([dictionary objectForKey:@"contactAddressLine2"])
            self.contactAddressLine2 = [dictionary objectForKey:@"contactAddressLine2"];
        if ([dictionary objectForKey:@"contactCity"])
            self.contactCity = [dictionary objectForKey:@"contactCity"];
        if ([dictionary objectForKey:@"contactCountry"])
            self.contactCountry = [dictionary objectForKey:@"contactCountry"];
        if ([dictionary objectForKey:@"contactEmail"])
            self.contactEmail = [dictionary objectForKey:@"contactEmail"];
        if ([dictionary objectForKey:@"contactFax"])
            self.contactFax = [dictionary objectForKey:@"contactFax"];
        if ([dictionary objectForKey:@"contactFirstName"])
            self.contactFirstName = [dictionary objectForKey:@"contactFirstName"];
        if ([dictionary objectForKey:@"contactFullAddress"])
            self.contactFullAddress = [dictionary objectForKey:@"contactFullAddress"];
        if ([dictionary objectForKey:@"contactFullName"])
            self.contactFullName = [dictionary objectForKey:@"contactFullName"];
        if ([dictionary objectForKey:@"contactId"])
            self.contactId = [dictionary objectForKey:@"contactId"];
        if ([dictionary objectForKey:@"contactLastName"])
            self.contactLastName = [dictionary objectForKey:@"contactLastName"];
        if ([dictionary objectForKey:@"contactMiddleName"])
            self.contactMiddleName = [dictionary objectForKey:@"contactMiddleName"];
        if ([dictionary objectForKey:@"contactMobilePhone"])
            self.contactMobilePhone = [dictionary objectForKey:@"contactMobilePhone"];
        if ([dictionary objectForKey:@"contactPhone"])
            self.contactPhone = [dictionary objectForKey:@"contactPhone"];
        if ([dictionary objectForKey:@"contactPostalCode"])
            self.contactPostalCode = [dictionary objectForKey:@"contactPostalCode"];
        if ([dictionary objectForKey:@"contactState"])
            self.contactState = [dictionary objectForKey:@"contactState"];
        if ([dictionary objectForKey:@"createdBy"])
            self.createdBy = [dictionary objectForKey:@"createdBy"];
        if ([dictionary objectForKey:@"createdOn"])
            self.createdOn = [dictionary objectForKey:@"createdOn"];
        if ([dictionary objectForKey:@"domainId"])
            self.domainId = [dictionary objectForKey:@"domainId"];
        if ([dictionary objectForKey:@"industryId"])
            self.industryId = [dictionary objectForKey:@"industryId"];
        if ([dictionary objectForKey:@"lastUpdatedBy"])
            self.lastUpdatedBy = [dictionary objectForKey:@"lastUpdatedBy"];
        if ([dictionary objectForKey:@"lastUpdatedOn"])
            self.lastUpdatedOn = [dictionary objectForKey:@"lastUpdatedOn"];
        if ([dictionary objectForKey:@"merchantBankId"])
            self.contactState = [dictionary objectForKey:@"merchantBankId"];
        if ([dictionary objectForKey:@"merchantBankStr"])
            self.merchantBankStr = [dictionary objectForKey:@"merchantBankStr"];
        if ([dictionary objectForKey:@"merchantCode"])
            self.merchantCode = [dictionary objectForKey:@"merchantCode"];
        if ([dictionary objectForKey:@"merchantId"])
            self.merchantId = [dictionary objectForKey:@"merchantId"];
        if ([dictionary objectForKey:@"merchantName"])
            self.merchantName = [dictionary objectForKey:@"merchantName"];
        if ([dictionary objectForKey:@"merchantRegCode"])
            self.merchantRegCode = [dictionary objectForKey:@"merchantRegCode"];
        if ([dictionary objectForKey:@"status"])
            self.status = [dictionary objectForKey:@"status"];
    }
    
    return self;
}

@end
