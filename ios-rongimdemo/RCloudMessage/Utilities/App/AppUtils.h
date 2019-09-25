//
//  AppUtils.h
//  RCloudMessage
//
//  Created by mac on 2019/7/2.
//  Copyright © 2019年 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RongIMLib/RCUserInfo.h>

@interface AppUtils: NSObject

+ (NSString *)getStringMD5:(NSString*)str;
// login
+ (void)loginWithPhone:(NSString *)phone;
@end
