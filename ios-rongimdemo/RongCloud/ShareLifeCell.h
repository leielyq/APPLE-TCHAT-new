//
//  ShareLifeCell.h
//  SealTalk
//
//  Created by mac on 2019/7/16.
//  Copyright © 2019 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShareLifeCell : UITableViewCell//该类继承于UITableViewCell

@property (retain,nonatomic) IBOutlet UILabel * lbl_name;
@property (retain,nonatomic) IBOutlet UILabel * lbl_ID;
@property (retain,nonatomic) IBOutlet UILabel * lbl_gender;
@property (retain,nonatomic) IBOutlet UIImageView * lbl_headPortrait;

@end
