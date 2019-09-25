//
//  NSString+EncodeUtils.h
//  SealTalk
//
//  Created by mac on 2019/7/3.
//  Copyright © 2019 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (EncodeUtils)
+ (NSString *)getStringMD5:(NSString*)str;
@end

NS_ASSUME_NONNULL_END
