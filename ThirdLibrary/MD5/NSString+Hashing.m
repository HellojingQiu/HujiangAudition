//
//  NSString+Hashing.m
//  HujiangAudition
//
//  Created by qianfeng on 14/12/30.
//  Copyright (c) 2014年 Cool. All rights reserved.
//

#import "NSString+Hashing.h"
#import <CommonCrypto/CommonDigest.h>
#define CC_MD5_DIGEST_LENGTH 16

@implementation NSString (Hashing)
-(NSString *)MD5Hash{
    const char *cStr=[self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, strlen(cStr), result);
    
    NSMutableString *output=[NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    
    for (int i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x",result[i]];
    }
    
    return output;
}

-(NSString *)Sha1Hash{
    const char *cStr=[self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data=[NSData dataWithBytes:cStr length:self.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, data.length, digest);
    NSMutableString *output=[NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH*2];
    for (int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x",digest[i]];
    }
    return output;
}

//const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
//NSData *data = [NSData dataWithBytes:cstr length:input.length];
//
//uint8_t digest[CC_SHA1_DIGEST_LENGTH];
//
//CC_SHA1(data.bytes, data.length, digest);
//
//NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
//
//for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
//[output appendFormat:@"%02x", digest[i]];
//
//return output;
@end
