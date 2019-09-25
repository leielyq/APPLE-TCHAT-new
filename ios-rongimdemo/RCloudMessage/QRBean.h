//
//  QRBean.h
//  SealTalk
//
//  Created by mac on 2019/9/24.
//  Copyright © 2019 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QRBean : NSObject
    
    /** ID */
    @property(nonatomic, strong) NSString *title;
    
    /** 邀请人id */
    @property(nonatomic, strong) NSString *meuserid;
    
    /** 1为群组id */
    @property(nonatomic, strong) NSString *status;

@end

NS_ASSUME_NONNULL_END
