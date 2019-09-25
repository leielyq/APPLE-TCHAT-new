
//
//  AFHttpTool.m
//  RCloud_liv_demo
//
//  Created by Liv on 14-10-22.
//  Copyright (c) 2014年 RongCloud. All rights reserved.
//

#import "AFHttpTool.h"
#import "AFNetworking.h"
#import "RCDCommonDefine.h"
#import <RongIMKit/RongIMKit.h>

#import "RCDSettingUserDefaults.h"



#define DemoServer @"https://imsever.jimmychat.com/" //线上正式环境
#define Server @"https://imsever.jimmychat.com/"

#define ContentType @"text/html"

@implementation AFHttpTool

+ (AFHttpTool *)shareInstance {
    static AFHttpTool *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

+ (void)requestWihtMethod:(RequestMethodType)methodType
                      url:(NSString *)url
                   params:(NSDictionary *)params
                  success:(void (^)(id response))success
                  failure:(void (^)(NSError *err))failure {
    NSURL *baseURL = nil;
    BOOL isPrivateMode = NO;
#if RCDPrivateCloudManualMode
    isPrivateMode = YES;
#endif

    if (isPrivateMode) {
        NSString *baseStr = [RCDSettingUserDefaults getRCDemoServer];
        baseURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", baseStr]];
    } else {
        baseURL = [NSURL URLWithString:DemoServer];
    }
    //获得请求管理者
    AFHTTPRequestOperationManager *mgr = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];

//#ifdef ContentType
//    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:ContentType];
//#endif
    
    mgr.requestSerializer.HTTPShouldHandleCookies = YES;

    NSString *cookieString = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserCookies"];

    if (cookieString)
        [mgr.requestSerializer setValue:cookieString forHTTPHeaderField:@"Cookie"];
    [mgr.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];

    NSString *token =  [RCDSettingUserDefaults getUserToken];
    NSString *deviceid =   [RCDSettingUserDefaults getUserDevice];
    [mgr.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    [mgr.requestSerializer setValue:deviceid forHTTPHeaderField:@"deviceid"];
    
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    switch (methodType) {
    case RequestMethodTypeGet: {
        // GET请求
        [mgr GET:url
            parameters:params
            success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObj) {
                if (success) {

                    success(responseObj);
                }
            }
            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                if (failure) {
                    failure(error);
                }
            }];

    } break;

    case RequestMethodTypePost: {
        // POST请求
        [mgr POST:url
            parameters:params
            success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObj) {
                if (success) {
                    if ([url isEqualToString:@"user/login"]) {
                        NSString *cookieString = [[operation.response allHeaderFields] valueForKey:@"Set-Cookie"];
                        NSMutableString *finalCookie = [NSMutableString new];
                        //                      NSData *data = [NSKeyedArchiver
                        //                      archivedDataWithRootObject:cookieString];
                        NSArray *cookieStrings = [cookieString componentsSeparatedByString:@","];
                        for (NSString *temp in cookieStrings) {
                            NSArray *tempArr = [temp componentsSeparatedByString:@";"];
                            [finalCookie appendString:[NSString stringWithFormat:@"%@;", tempArr[0]]];
                        }
                        [[NSUserDefaults standardUserDefaults] setObject:finalCookie forKey:@"UserCookies"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                    }
                    success(responseObj);
                }
            }
            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                if (failure) {
                    failure(error);
                }
            }];
    } break;
    default:
        break;
    }
}

+ (void)requestWihtMethod01:(RequestMethodType)methodType
                      url:(NSString *)url
                   params:(NSDictionary *)params
                  success:(void (^)(id response))success
                  failure:(void (^)(NSError *err))failure {
    NSURL *baseURL = nil;
    BOOL isPrivateMode = NO;
#if RCDPrivateCloudManualMode
    isPrivateMode = YES;
#endif
    
    if (isPrivateMode) {
        NSString *baseStr = [RCDSettingUserDefaults getServer];
        baseURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", baseStr]];
    } else {
        baseURL = [NSURL URLWithString:Server];
    }
    //获得请求管理者
    AFHTTPRequestOperationManager *mgr = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    AFHTTPRequestSerializer *request = [AFHTTPRequestSerializer serializer];
    
    mgr.requestSerializer = request;
#ifdef ContentType
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:ContentType];
#endif
    mgr.requestSerializer.HTTPShouldHandleCookies = YES;
    
    NSString *cookieString = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserCookies"];
    
    if (cookieString)
        [mgr.requestSerializer setValue:cookieString forHTTPHeaderField:@"Cookie"];
    [mgr.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];


    [mgr.requestSerializer setValue:[RCDSettingUserDefaults getUserToken] forHTTPHeaderField:@"token"];
    [mgr.requestSerializer setValue:[RCDSettingUserDefaults getUserDevice] forHTTPHeaderField:@"deviceid"];

    
    
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    switch (methodType) {
        case RequestMethodTypeGet: {
            // GET请求
            [mgr GET:url
          parameters:params
             success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObj) {
                 NSLog(@"+++++++++%@+++++++++++",url);
                 NSLog(@"==========%@===========", params);
                 NSLog(@"%@", responseObj);
                 NSLog(@"-----------------------");
                 if (success) {
                     success(responseObj);
                 }
             }
             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"+++++++++%@+++++++++++",url);
                 NSLog(@"params==========%@===========", params);
                 NSLog(@"%@", error);
                 NSLog(@"-----------------------");
                 if (failure) {
                     failure(error);
                 }
             }];
            
        } break;
            
        case RequestMethodTypePost: {
            // POST请求
            [mgr POST:url
           parameters:params
              success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObj) {
                  NSLog(@"+++++++++%@+++++++++++",url);
                  NSLog(@"==========%@===========", params);
                  NSLog(@"%@", responseObj);
                  NSLog(@"-----------------------");
                  
                  if (success) {
                      if ([url isEqualToString:@"user/login"]) {
                          NSString *cookieString = [[operation.response allHeaderFields] valueForKey:@"Set-Cookie"];
                          NSMutableString *finalCookie = [NSMutableString new];
                          //                      NSData *data = [NSKeyedArchiver
                          //                      archivedDataWithRootObject:cookieString];
                          NSArray *cookieStrings = [cookieString componentsSeparatedByString:@","];
                          for (NSString *temp in cookieStrings) {
                              NSArray *tempArr = [temp componentsSeparatedByString:@";"];
                              [finalCookie appendString:[NSString stringWithFormat:@"%@;", tempArr[0]]];
                          }
                          [[NSUserDefaults standardUserDefaults] setObject:finalCookie forKey:@"UserCookies"];
                          [[NSUserDefaults standardUserDefaults] synchronize];
                      }
                      success(responseObj);
                  }
              }
              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  NSLog(@"+++++++++%@+++++++++++",url);
                  NSLog(@"%@", error);
                  NSLog(@"-----------------------");
                  if (failure) {
                      failure(error);
                  }
              }];
        } break;
        default:
            break;
    }
}

// check phone available
+ (void)checkPhoneNumberAvailable:(NSString *)region
                      phoneNumber:(NSString *)phoneNumber
                          success:(void (^)(id response))success
                          failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"region" : region, @"phone" : phoneNumber};

    [AFHttpTool requestWihtMethod:RequestMethodTypePost
                              url:@"user/check_phone_available"
                           params:params
                          success:success
                          failure:failure];
}

// get verification code
+ (void)getVerificationCode:(NSString *)email
                    success:(void (^)(id response))success
                    failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"email" : email};

    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:@"login/send_emial"
                           params:params
                          success:success
                          failure:failure];
}

// verfify verification code
+ (void)verifyVerificationCode:(NSString *)region
                   phoneNumber:(NSString *)phoneNumber
              verificationCode:(NSString *)verificationCode
                       success:(void (^)(id response))success
                       failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"email" : phoneNumber, @"code" : verificationCode};

    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:@"login/emial_successful"
                           params:params
                          success:success
                          failure:failure];
}

// reg nickname password verficationToken
+ (void)registerWithNickname:(NSString *)nickname
                       email:(NSString *)email
                 countrie_id:(NSString *)countrie_id
                         tel:(NSString *)tel
                        name:(NSString *)name
                      cardid:(NSString *)cardid
                        code:(NSString *)code
                    password:(NSString *)password
                     success:(void (^)(id response))success
                     failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"nickname" : nickname, @"password" : password, @"email" : email         ,@"name":name,@"cardid":cardid,@"code":code,@"tel":tel,
                             @"countrie_id":countrie_id,@"cardid":cardid
                             };

    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:@"login/sign"
                           params:params
                          success:success
                          failure:failure];
}

// login
+ (void)loginWithPhone:(NSString *)phone
              password:(NSString *)password
                region:(NSString *)region
               success:(void (^)(id response))success
               failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"region" : region, @"phone" : phone, @"password" : password};

    [AFHttpTool requestWihtMethod:RequestMethodTypePost
                              url:@"user/login"
                           params:params
                          success:success
                          failure:failure];
}

// login
+ (void)loginWithPhone01:(NSString *)phone
              password:(NSString *)password
                region:(NSString *)region
               success:(void (^)(id response))success
               failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"deviceid" : region, @"user" : phone, @"password" : password};
    NSLog(@"%@", params);
    
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:@"login/clogin"
                           params:params
                          success:success
                          failure:failure];
}

// get user info
//todo
+ (void)getUserInfoV1:(NSString *)userId
              success:(void (^)(id response))success
              failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"id" : userId};
    [AFHttpTool requestWihtMethod01:RequestMethodTypeGet
                                url:[NSString stringWithFormat:@"severfriend/friend_detail"]
                             params:params
                            success:success
                            failure:failure];
}

//获取用户详细资料
+ (void)getFriendDetailsByIDV1:(NSString *)friendId
                       success:(void (^)(id response))success
                       failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"id" : friendId};
    
    [AFHttpTool requestWihtMethod01:RequestMethodTypeGet
                                url:[NSString stringWithFormat:@"severfriend/friend_detail"]
                             params:params
                            success:success
                            failure:failure];
}

// modify nickname
+ (void)modifyNickname:(NSString *)userId
              nickname:(NSString *)nickname
               success:(void (^)(id response))success
               failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"nickname" : nickname};

    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:@"severuser/user_nickname"
                           params:params
                          success:success
                          failure:failure];
}

// change password
+ (void)changePassword:(NSString *)oldPwd
                newPwd:(NSString *)newPwd
               success:(void (^)(id response))success
               failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"oldPassword" : oldPwd, @"newPassword" : newPwd};

    [AFHttpTool requestWihtMethod:RequestMethodTypePost
                              url:@"user/change_password"
                           params:params
                          success:success
                          failure:failure];
}

// reset password
+ (void)resetPassword:(NSString *)password
               vToken:(NSString *)verification_token
              success:(void (^)(id response))success
              failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"password" : password, @"verification_token" : verification_token};

    [AFHttpTool requestWihtMethod:RequestMethodTypePost
                              url:@"user/reset_password"
                           params:params
                          success:success
                          failure:failure];
}

+ (void)getRegionlist:(void (^)(id response))success failure:(void (^)(NSError *))failure{
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:@"login/countrie_list"
                           params:nil
                          success:success
                          failure:failure];
}

// get user info
+ (void)getUserInfo:(NSString *)userId success:(void (^)(id response))success failure:(void (^)(NSError *err))failure {
    [AFHttpTool requestWihtMethod:RequestMethodTypeGet
                              url:[NSString stringWithFormat:@"user/%@", userId]
                           params:nil
                          success:success
                          failure:failure];
}





// set user portraitUri
+ (void)setUserPortraitUri:(NSString *)portraitUrl
                   success:(void (^)(id response))success
                   failure:(void (^)(NSError *err))failure {
    
    NSString *pic = [NSString stringWithFormat:@"data:image/png;base64,%@",portraitUrl];
    NSDictionary *params = @{@"img" : pic};
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:@"severuser/user_pic"
                           params:params
                          success:success
                          failure:failure];
}


// 分享新生活点赞
+ (void)zangShareLife:(NSString *)vid
                   success:(void (^)(id response))success
                   failure:(void (^)(NSError *err))failure {
    
    NSDictionary *params = @{@"vid" : vid};
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                                url:@"life/dongtai_click"
                             params:params
                            success:success
                            failure:failure];
}

// invite user
+ (void)inviteUser:(NSString *)userId success:(void (^)(id response))success failure:(void (^)(NSError *err))failure {
    if (!userId && failure) {
        NSError *error = [NSError errorWithDomain:NSOSStatusErrorDomain code:-1 userInfo:@{@"error": [NSString stringWithFormat:@"invalid parameter, userId is nil."]}];
        failure(error);
        return;
    }
    NSDictionary *params = @{
        @"to_userid" : userId
    };
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:@"severfriend/friend_add"
                           params:params
                          success:success
                          failure:failure];
}

// find user by phone
+ (void)findUserByPhone:(NSString *)Phone
                 region:(NSString *)region
                success:(void (^)(id response))success
                failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"keyword":Phone};
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:[NSString stringWithFormat:@"severfriend/friend_search"]
                           params:params
                          success:success
                          failure:failure];
}

// get token
+ (void)getTokenSuccess:(void (^)(id response))success failure:(void (^)(NSError *err))failure {
    [AFHttpTool requestWihtMethod:RequestMethodTypeGet
                              url:@"user/get_token"
                           params:nil
                          success:success
                          failure:failure];
}

// get friends
+ (void)getFriendsSuccess:(void (^)(id response))success failure:(void (^)(NSError *err))failure {
    //获取包含自己在内的全部注册用户数据
    [AFHttpTool requestWihtMethod:RequestMethodTypeGet url:@"friends" params:nil success:success failure:failure];
}

// get upload image token
+ (void)getUploadImageTokensuccess:(void (^)(id response))success failure:(void (^)(NSError *err))failure {
    [AFHttpTool requestWihtMethod:RequestMethodTypeGet
                              url:@"user/get_image_token"
                           params:nil
                          success:success
                          failure:failure];
}

// upload file
+ (void)uploadFile:(NSData *)fileData
            userId:(NSString *)userId
           success:(void (^)(id response))success
           failure:(void (^)(NSError *err))failure {
    [AFHttpTool getUploadImageTokensuccess:^(id response) {
        if ([response[@"code"] integerValue] == 200) {
            NSDictionary *result = response[@"result"];
            NSString *defaultDomain = result[@"domain"];
            NSString *uploadUrl = result[@"upload_url"];
            if (uploadUrl.length > 0 && ![uploadUrl hasPrefix:@"http"]) {
                uploadUrl = [NSString stringWithFormat:@"http://%@", uploadUrl];
            }
            [DEFAULTS setObject:defaultDomain forKey:@"QiNiuDomain"];
            [DEFAULTS synchronize];

            //设置七牛的Token
            NSString *token = result[@"token"];
            NSMutableDictionary *params = [NSMutableDictionary new];
            [params setValue:token forKey:@"token"];

            //获取系统当前的时间戳
            NSDate *dat = [NSDate dateWithTimeIntervalSinceNow:0];
            NSTimeInterval now = [dat timeIntervalSince1970] * 1000;
            NSString *timeString = [NSString stringWithFormat:@"%f", now];
            NSString *key = [NSString stringWithFormat:@"%@%@", userId, timeString];
            //去掉字符串中的.
            NSMutableString *str = [NSMutableString stringWithString:key];
            for (int i = 0; i < str.length; i++) {
                unichar c = [str characterAtIndex:i];
                NSRange range = NSMakeRange(i, 1);
                if (c == '.') { //此处可以是任何字符
                    [str deleteCharactersInRange:range];
                    --i;
                }
            }
            key = [NSString stringWithString:str];
            [params setValue:key forKey:@"key"];

            NSMutableDictionary *ret = [NSMutableDictionary dictionary];
            [params addEntriesFromDictionary:ret];

            NSString *url = uploadUrl.length > 0 ? uploadUrl : @"https://up.qbox.me";

            NSData *imageData = fileData;

            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            if (uploadUrl.length > 0) {
                NSMutableSet *contentTypes =
                    [[NSMutableSet alloc] initWithSet:manager.responseSerializer.acceptableContentTypes];
                [contentTypes addObject:@"text/html"];
                manager.responseSerializer.acceptableContentTypes = [contentTypes copy];
            }
            [manager POST:url
                parameters:params
                constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                    [formData appendPartWithFileData:imageData
                                                name:@"file"
                                            fileName:key
                                            mimeType:@"application/octet-stream"];
                }
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    if (uploadUrl.length > 0) {
                        NSMutableDictionary *responseDic =
                            [[NSMutableDictionary alloc] initWithDictionary:responseObject];
                        [responseDic setValue:defaultDomain forKey:@"domain"];
                        success([responseDic copy]);
                    } else {
                        success(responseObject);
                    }

                }
                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    NSLog(@"请求失败");
                }];
        }
    }
                                   failure:^(NSError *err){

                                   }];
}

// get square info
+ (void)getSquareInfoSuccess:(void (^)(id response))success Failure:(void (^)(NSError *err))failure {
    [AFHttpTool requestWihtMethod:RequestMethodTypeGet
                              url:@"misc/demo_square"
                           params:nil
                          success:success
                          failure:failure];
}

// create group
+ (void)createGroupWithGroupName:(NSString *)groupName
                 groupMemberList:(NSArray *)groupMemberList
                         success:(void (^)(id response))success
                         failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"groupname" : groupName, @"memberIds" : groupMemberList};
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:@"/usergroup/create_group"
                           params:params
                          success:success
                          failure:failure];
}

+ (void)getMyGroupsSuccess:(void (^)(id response))success failure:(void (^)(NSError *err))failure {
//    [AFHttpTool requestWihtMethod:RequestMethodTypeGet url:@"user/groups" params:nil success:success failure:failure];
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost url:@"usergroup/my_group" params:nil success:success failure:failure];
}

+(void)getMyGroupsSuccessV1:(void(^)(id response))success
                    failure:(void (^)(NSError *err))failure{
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost url:@"usergroup/my_group" params:nil success:success failure:failure];
}

// get group by id
+ (void)getGroupByID:(NSString *)groupID
             success:(void (^)(id response))success
             failure:(void (^)(NSError *err))failure {
    [AFHttpTool requestWihtMethod:RequestMethodTypeGet
                              url:[NSString stringWithFormat:@"group/%@", groupID]
                           params:nil
                          success:success
                          failure:failure];
}

// get group by id
+ (void)getGroupByIDV1:(NSString *)groupID
             success:(void (^)(id response))success
             failure:(void (^)(NSError *err))failure {
    NSDictionary *dic = @{@"groupid":groupID};
    [AFHttpTool requestWihtMethod01:RequestMethodTypeGet
                              url:@"/usergroup/group_detail"
                           params:dic
                          success:success
                          failure:failure];
}

//获取分享新生活
+ (void)getShareLifes:(NSString *)type
              success:(void (^)(id response))success
              failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"type":type,@"size":@10,@"page":@1};
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                                url:@"life/friends_list"
                             params:params
                            success:success
                            failure:failure];
}


// set group portraitUri
+ (void)setGroupPortraitUri:(NSString *)portraitUrl
                    groupId:(NSString *)groupId
                    success:(void (^)(id response))success
                    failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"groupId" : groupId, @"portraitUri" : portraitUrl};
    [AFHttpTool requestWihtMethod:RequestMethodTypePost
                              url:@"group/set_portrait_uri"
                           params:params
                          success:success
                          failure:failure];
}

// get group members by id
+ (void)getGroupMembersByID:(NSString *)groupID
                    success:(void (^)(id response))success
                    failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"groupid" : groupID};
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:[NSString stringWithFormat:@"usergroup/group_user_list"]
                           params:params
                          success:success
                          failure:failure];
}

// join group by groupId
+ (void)joinGroupWithGroupId:(NSString *)groupID
                     success:(void (^)(id response))success
                     failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"groupId" : groupID};
    [AFHttpTool requestWihtMethod:RequestMethodTypePost
                              url:@"group/join"
                           params:params
                          success:success
                          failure:failure];
}

// add users into group
+ (void)addUsersIntoGroup:(NSString *)groupID
                  usersId:(NSMutableArray *)usersId
                  success:(void (^)(id response))success
                  failure:(void (^)(NSError *err))failure {
    NSString *user = [usersId componentsJoinedByString:@","];
    NSDictionary *params = @{@"groupid" : groupID, @"userid" : user};
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost url:@"usergroup/invitation_group" params:params success:success failure:failure];
}

// kick users out of group
+ (void)kickUsersOutOfGroup:(NSString *)groupID
                    usersId:(NSMutableArray *)usersId
                    success:(void (^)(id response))success
                    failure:(void (^)(NSError *err))failure {
    NSString *user = [usersId componentsJoinedByString:@","];
    NSDictionary *params = @{@"groupid" : groupID, @"userid" : user};
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:@"usergroup/del_group"
                           params:params
                          success:success
                          failure:failure];
}

// quit group with groupId
+ (void)quitGroupWithGroupId:(NSString *)groupID
                     success:(void (^)(id response))success
                     failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"groupid" : groupID};
    [AFHttpTool requestWihtMethod:RequestMethodTypePost
                              url:@"group/quit"
                           params:params
                          success:success
                          failure:failure];
}

// dismiss group with groupId
+ (void)dismissGroupWithGroupId:(NSString *)groupID
                        success:(void (^)(id response))success
                        failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"groupid" : groupID};
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:@"usergroup/dissolution_group"
                           params:params
                          success:success
                          failure:failure];
}

// rename group with groupId
+ (void)renameGroupWithGroupId:(NSString *)groupID
                     GroupName:(NSString *)groupName
                       success:(void (^)(id response))success
                       failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"groupId" : groupID, @"name" : groupName};
    [AFHttpTool requestWihtMethod:RequestMethodTypePost
                              url:@"group/rename"
                           params:params
                          success:success
                          failure:failure];
}

+ (void)getFriendListFromServerSuccess:(void (^)(id))success failure:(void (^)(NSError *))failure {
    //获取除自己之外的好友信息
    [AFHttpTool requestWihtMethod:RequestMethodTypeGet
                              url:[NSString stringWithFormat:@"friendship/all"]
                           params:nil
                          success:success
                          failure:failure];
}

+ (void)getFriendListFromServerSuccessV1:(void (^)(id))success failure:(void (^)(NSError *))failure {
    //获取除自己之外的好友信息
    [AFHttpTool requestWihtMethod01:RequestMethodTypeGet
                              url:[NSString stringWithFormat:@"severfriend/friend_listV1"]
                           params:nil
                          success:success
                          failure:failure];
}

+ (void)processInviteFriendRequest:(NSString *)friendUserId
                      currentUseId:(NSString *)currentUserId
                              time:(NSString *)now
                           success:(void (^)(id))success
                           failure:(void (^)(NSError *))failure {
    NSDictionary *params = @{@"friendId" : friendUserId, @"currentUserId" : currentUserId, @"time" : now};
    [AFHttpTool requestWihtMethod:RequestMethodTypePost url:@"agree" params:params success:success failure:failure];
}

+ (void)processInviteFriendRequest:(NSString *)friendUserId
                           success:(void (^)(id))success
                           failure:(void (^)(NSError *))failure {
    NSDictionary *params = @{@"id" : friendUserId};
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:@"/severfriend/friend_successful"
                           params:params
                          success:success
                          failure:failure];
}

//加入黑名单
+ (void)addToBlacklist:(NSString *)userId
               success:(void (^)(id response))success
               failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"to_userid" : userId};
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:@"severuser/black_add"
                           params:params
                          success:success
                          failure:failure];
}

//从黑名单中移除
+ (void)removeToBlacklist:(NSString *)userId
                  success:(void (^)(id response))success
                  failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"to_userid" : userId};
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:@"severuser/black_del"
                           params:params
                          success:success
                          failure:failure];
}

//获取黑名单列表
+ (void)getBlacklistsuccess:(void (^)(id response))success failure:(void (^)(NSError *err))failure {
    [AFHttpTool requestWihtMethod01:RequestMethodTypeGet
                              url:@"severuser/black_list"
                           params:nil
                          success:success
                          failure:failure];
}

//讨论组接口，暂时保留
+ (void)updateName:(NSString *)userName success:(void (^)(id response))success failure:(void (^)(NSError *err))failure {
    [AFHttpTool requestWihtMethod:RequestMethodTypePost
                              url:@"update_profile"
                           params:@{@"username" : userName}
                          success:success
                          failure:failure];
}

//获取版本信息
+ (void)getVersionsuccess:(void (^)(id response))success failure:(void (^)(NSError *err))failure {
    [AFHttpTool requestWihtMethod:RequestMethodTypeGet
                              url:@"/misc/client_version"
                           params:nil
                          success:success
                          failure:failure];
}

//设置好友备注
+ (void)setFriendDisplayName:(NSString *)friendId
                 displayName:(NSString *)displayName
                     success:(void (^)(id response))success
                     failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"to_userid" : friendId, @"name" : displayName};
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:@"severfriend/note_edite"
                           params:params
                          success:success
                          failure:failure];
}

//获取用户详细资料
+ (void)getFriendDetailsByID:(NSString *)friendId
                     success:(void (^)(id response))success
                     failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"id":friendId};
    [AFHttpTool requestWihtMethod01:RequestMethodTypeGet
                              url:[NSString stringWithFormat:@"severfriend/friend_detail"]
                           params:params
                          success:success
                          failure:failure];
}


//获取分享新生活的评论列表
+ (void)getShareLifeComments:(NSString *)uId
                     success:(void (^)(id response))success
                     failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"video_id":uId};
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                              url:[NSString stringWithFormat:@"life/comment_list"]
                           params:params
                          success:success
                          failure:failure];
}

//添加分享新生活的评论
+ (void)sendShareLifeComments:(NSString *)uId
                        to_id:(NSString *)to_id
                      content:(NSString *)content
                     success:(void (^)(id response))success
                     failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{@"video_id":uId,@"to_id":to_id,@"content":content};
    [AFHttpTool requestWihtMethod01:RequestMethodTypePost
                                url:[NSString stringWithFormat:@"life/comment_add"]
                             params:params
                            success:success
                            failure:failure];
}


@end
