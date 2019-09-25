//
//  NSString+EncodeUtils.m
//  SealTalk
//
//  Created by mac on 2019/7/3.
//  Copyright © 2019 RongCloud. All rights reserved.
//

#import "NSString+EncodeUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (EncodeUtils)
+ (NSString *)getStringMD5:(NSString*)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    return digest;
    
}
@end
