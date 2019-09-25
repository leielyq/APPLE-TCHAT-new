//
//  RCDCountry.m
//  SealTalk
//
//  Created by 张改红 on 2019/2/18.
//  Copyright © 2019年 RongCloud. All rights reserved.
//

#import "RCDCountry.h"
@interface RCDCountry ()
@property (nonatomic, strong) NSString *locale;
@property(nonatomic, strong) NSString *countryName;
@property(nonatomic, strong) NSString *countryId;
@end
@implementation RCDCountry
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.phoneCode = [dict objectForKey:@"countrie_quhao"];
        NSString *locale = [dict objectForKey:@"countrie_name"];
        self.locale = locale;
        self.countryId = [dict objectForKey:@"id"];
    }
    return self;
}

- (NSDictionary *)getModelJson{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:self.phoneCode forKey:@"countrie_quhao"];
    [dic setObject:self.locale forKey:@"countrie_name"];
    [dic setObject:self.countryId forKey:@"id"];
    return dic.copy;
}

- (NSString *)countryName{
    
    return self.locale;
}

@end
