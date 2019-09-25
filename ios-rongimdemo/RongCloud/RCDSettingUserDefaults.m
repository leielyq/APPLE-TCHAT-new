//
//  RCDSettingUserDefaults.m
//  RCloudMessage
//
//  Created by Sin on 16/9/21.
//  Copyright © 2016年 RongCloud. All rights reserved.
//

#import "RCDSettingUserDefaults.h"
#import <CommonCrypto/CommonDigest.h>

#define RCUserDefaultsSet(value, key) [[NSUserDefaults standardUserDefaults] setValue:value forKey:key]
#define RCUserDefaultsGet(key) [[NSUserDefaults standardUserDefaults] valueForKey:key]

static NSString *rcAppKeySettingKey = @"rcAppKeySettingKey";
static NSString *rcDemoServerSettingKey = @"rcDemoServerSettingKey";
static NSString *rcNaviServerSettingKey = @"rcNaviServerSettingKey";
static NSString *rcFileServerSettingKey = @"rcFileServerSettingKey";
static NSString *userToken = @"UserToken";
static NSString *userDevice = @"UserDevice";

@implementation RCDSettingUserDefaults
#pragma mark - set
//设置appKey
+ (void)setRCAppKey:(NSString *)appKey {
    RCUserDefaultsSet(appKey, rcAppKeySettingKey);
}
//设置DemoServer
+ (void)setRCDemoServer:(NSString *)demoServer {
    RCUserDefaultsSet(demoServer, rcDemoServerSettingKey);
}
//设置NaviServer
+ (void)setRCNaviServer:(NSString *)naviServer {
    RCUserDefaultsSet(naviServer, rcNaviServerSettingKey);
}
//设置FileServer
+ (void)setRCFileServer:(NSString *)fileServer {
    RCUserDefaultsSet(fileServer, rcFileServerSettingKey);
}

//设置UserToken
+ (void)setUserToken:(NSString *)token{
    RCUserDefaultsSet(token, userToken);
}

//设置UserDevice
+ (void)setuserDevice:(NSString *)device{
    RCUserDefaultsSet(device, userDevice);
}


#pragma mark - get
//获取appKey
+ (NSString *)getRCAppKey {
    return RCUserDefaultsGet(rcAppKeySettingKey);
}
//获取DemoServer
+ (NSString *)getRCDemoServer {
    return RCUserDefaultsGet(rcDemoServerSettingKey);
}
//获取Server
+ (NSString *)getServer {
    return RCUserDefaultsGet(@"https://imsever.jimmychat.com/");
}
//获取NaviServer
+ (NSString *)getRCNaviServer {
    return RCUserDefaultsGet(rcNaviServerSettingKey);
}
//获取FileServer
+ (NSString *)getRCFileServer {
    return RCUserDefaultsGet(rcFileServerSettingKey);
}

//获取UserToken
+ (NSString *)getUserToken{
    return RCUserDefaultsGet(userToken);
}

//获取UserDevice
+ (NSString *)getUserDevice{
    return RCUserDefaultsGet(userDevice);
}

//获取String 的MD5
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
