//
//  QRViewController.h
//  SealTalk
//
//  Created by mac on 2019/9/25.
//  Copyright © 2019 RongCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QRViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *img_qr;
@property(nonatomic, strong) NSString *target;


@end

NS_ASSUME_NONNULL_END
