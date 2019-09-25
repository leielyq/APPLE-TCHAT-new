//
//  AppDelegate.h
//  RongCloud
//
//  Created by Liv on 14/10/31.
//  Copyright (c) 2014年 RongCloud. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>
#import <UIKit/UIKit.h>
#import <Flutter/Flutter.h>
#import <FlutterBoost.h>

@interface AppDelegate : FLBFlutterAppDelegate <UIApplicationDelegate, RCIMConnectionStatusDelegate, RCIMReceiveMessageDelegate>

@property(strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) FlutterEngine *flutterEngine;

- (void)loginSuccessFlutter:(NSString *)userName
                     userId:(NSString *)userId
                      token:(NSString *)token
                   password:(NSString *)password
                   deviceid:(NSString *)deviceid;

@end
