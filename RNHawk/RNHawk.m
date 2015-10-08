//
//  RNHawk.m
//  RNHawk
//
//  Created by Andy Scott on 10/7/15.
//  Copyright (c) 2015 Andy Scott. All rights reserved.
//

#import "RNHawk.h"
#import "Hawk/HawkAuth.h"

#import <RCTConvert.h>

@implementation RNHawk

RCT_EXPORT_MODULE()


RCT_ENUM_CONVERTER(CryptoAlgorithm, (@{
                                       @"sha1"  : @(CryptoAlgorithmSHA1),
                                       @"sha224": @(CryptoAlgorithmSHA224),
                                       @"sha256": @(CryptoAlgorithmSHA256),
                                       @"sha384": @(CryptoAlgorithmSHA384),
                                       @"sha512": @(CryptoAlgorithmSHA512)
                                       }), CryptoAlgorithmSHA256, integerValue)

RCT_EXPORT_METHOD(generateRequestHeader:(NSDictionary *)args
                  callback:(RCTResponseSenderBlock)callback)
{
    NSDictionary *credentials = args[@"credentials"];
    
    HawkAuth    *auth   = [[HawkAuth alloc] init];
    auth.credentials    = [[HawkCredentials alloc] initWithHawkId: [RCTConvert NSString:credentials[@"id"]]
                                                          withKey: [RCTConvert NSString:credentials[@"key"]]
                                                    withAlgorithm: [RNHawk CryptoAlgorithm:credentials[@"algorithm"]]];
    
    auth.method                        = [RCTConvert NSString:args[@"method"]];
    auth.requestUri                    = [RCTConvert NSString:args[@"requestUri"]];
    auth.host                          = [RCTConvert NSString:args[@"host"]];
    auth.port                          = [RCTConvert NSNumber:args[@"port"]];
    auth.timestamp                     = [RCTConvert NSDate:args[@"timestamp"]];
    auth.nonce                         = args[@"nonce"] ? [RCTConvert NSString:args[@"nonce"]] : [[NSUUID UUID] UUIDString];
    if (args[@"ext"])     auth.ext     = [RCTConvert NSString:args[@"ext"]];
    if (args[@"app"])     auth.app     = [RCTConvert NSString:args[@"app"]];
    if (args[@"dlg"])     auth.dlg     = [RCTConvert NSString:args[@"dlg"]];
    if (args[@"payload"]) auth.payload = [RCTConvert NSData:args[@"payload"]];
    auth.contentType                   = [RCTConvert NSString:args[@"contentType"]];

    callback(@[[auth requestHeader]]);
    
    
}


@end
