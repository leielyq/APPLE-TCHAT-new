//
//  UserInfoBean.h
//  SealTalk
//
//  Created by mac on 2019/9/24.
//  Copyright © 2019 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoBean : NSObject
    /** ID */
    @property(nonatomic, strong) NSString *countrie_name;
     @property(nonatomic, strong) NSString *email;
     @property(nonatomic, strong) NSString *id;
     @property(nonatomic, strong) NSString *nickname;
     @property(nonatomic, strong) NSString *pic;
@end

NS_ASSUME_NONNULL_END
