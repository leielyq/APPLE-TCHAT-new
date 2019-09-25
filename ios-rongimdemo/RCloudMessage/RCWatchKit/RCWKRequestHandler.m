//
//  RCWKRequestHandler.m
//  RongIMDemo
//
//  Created by litao on 15/3/30.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//
#import "RCWKRequestHandler.h"
#import "RCWKNotifier.h"

@interface RCWKRequestHandler ()
@property(strong, nonatomic) NSDictionary *userInfo;
@property(strong, nonatomic) void (^reply)(NSDictionary *);
@property(weak, nonatomic) id<RCWKAppInfoProvider> provider;
@end

@implementation RCWKRequestHandler
- (instancetype)initHelperWithUserInfo:(NSDictionary *)userInfo
                              provider:(id<RCWKAppInfoProvider>)provider
                                 reply:(void (^)(NSDictionary *))reply {
    self = [super init];

    if (self) {
        self.userInfo = userInfo;
        self.reply = reply;
        self.provider = provider;
    }

    return self;
}

- (BOOL)handleWatchKitRequest {
   
    return YES;
}

- (void)replyWKApp:(id)replyObject {
   
}
- (NSString *)getQuery {
    return @"123";
}

- (id)getQueryParameter:(NSString *)parameterType {
    return self.userInfo[parameterType];
}

- (UIImage *)scaleImage:(UIImage *)image maxWidth:(NSUInteger)maxWidth round:(BOOL)round {
    if (round) {
        CGRect frame = CGRectMake(0, 0, maxWidth, maxWidth);
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(maxWidth, maxWidth), NO, 1.0);
        [[UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:maxWidth / 2] addClip];
        [image drawInRect:frame];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    } else if (image.size.width > maxWidth) {
        double scale = maxWidth / image.size.width;
        CGSize size = CGSizeMake(maxWidth, image.size.height * scale);
        UIGraphicsBeginImageContext(size);
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        image = scaledImage;
    }
    return image;
}

- (BOOL)copyImage:(UIImage *)image to:(NSString *)to maxWidth:(int)maxWidth round:(BOOL)round {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *containerUrl = [fileManager containerURLForSecurityApplicationGroupIdentifier:[self.provider getAppGroups]];
    containerUrl = [containerUrl URLByAppendingPathComponent:to];

    image = [self scaleImage:image maxWidth:maxWidth round:round];
    NSData *data = UIImagePNGRepresentation(image);

    return [data writeToURL:containerUrl atomically:YES];
}
- (BOOL)copyForShare:(NSString *)fromPath to:(NSString *)to maxWidth:(int)maxWidth {

    UIImage *image = [UIImage imageWithContentsOfFile:fromPath];
    return [self copyImage:image to:to maxWidth:maxWidth round:NO];
}
- (BOOL)isLocalPath:(NSString *)path {
    if ([path length] && ([path characterAtIndex:0] == '/' || [path characterAtIndex:0] == '~')) {
        return YES;
    }
    return NO;
}
@end
