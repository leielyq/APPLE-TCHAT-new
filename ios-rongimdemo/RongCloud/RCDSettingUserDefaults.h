//
//  RCDSettingUserDefaults.h
//  RCloudMessage
//
//  Created by Sin on 16/9/21.
//  Copyright © 2016年 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCDSettingUserDefaults : NSObject
#pragma mark - set
//设置appKey
+ (void)setRCAppKey:(NSString *)appKey;
//设置DemoServer
+ (void)setRCDemoServer:(NSString *)demoServer;
//设置NaviServer
+ (void)setRCNaviServer:(NSString *)naviServer;
//设置FileServer
+ (void)setRCFileServer:(NSString *)fileServer;
//设置UserToken
+ (void)setUserToken:(NSString *)token;

//设置UserDevice
+ (void)setuserDevice:(NSString *)device;

+ (NSString *)getStringMD5:(NSString*)str;

#pragma mark - get
//获取appKey
+ (NSString *)getRCAppKey;
//获取DemoServer
+ (NSString *)getRCDemoServer;
//获取Server
+ (NSString *)getServer;
//获取NaviServer
+ (NSString *)getRCNaviServer;
//获取FileServer
+ (NSString *)getRCFileServer;

//获取UserToken
+ (NSString *)getUserToken;

//获取UserDevice
+ (NSString *)getUserDevice;

@end
