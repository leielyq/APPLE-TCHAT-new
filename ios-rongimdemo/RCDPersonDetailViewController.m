//
//  RCDPersonDetailViewController.m
//  RCloudMessage
//
//  Created by Liv on 15/4/9.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import "RCDPersonDetailViewController.h"
#import "AFHttpTool.h"
#import "DefaultPortraitView.h"
#import "MBProgressHUD.h"
#import "RCDChatViewController.h"
#import "RCDFrienfRemarksViewController.h"
#import "RCDHttpTool.h"
#import "RCDataBaseManager.h"
#import "UIColor+RCColor.h"
#import "UIImageView+WebCache.h"
#import <RongCallKit/RongCallKit.h>
#import "RCDUIBarButtonItem.h"
@interface RCDPersonDetailViewController () <UIActionSheetDelegate>
@property(nonatomic) BOOL inBlackList;
@property(nonatomic, strong) NSDictionary *subViews;
@property(nonatomic, strong) RCDUserInfo *friendInfo;
@property(nonatomic, strong) NSArray *constraintNameLabel;
@property(nonatomic, strong) NSArray *constraintdisplayNameLabel;
@property(nonatomic, strong) UILabel *displayNameLabel;
@property(nonatomic, strong) UILabel *phoneNumberLabel;
@property(nonatomic, strong) UILabel *onlineStatusLabel;
@property(nonatomic, strong) NSString *phonenumber;
@end

@implementation RCDPersonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationButtons];
    self.view.backgroundColor = [UIColor colorWithHexString:@"f0f0f6" alpha:1.f];

    self.infoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 85)];
    self.infoView = [[UIView alloc] init];
    self.infoView.backgroundColor = [UIColor whiteColor];
    self.infoView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.infoView];

    self.ivAva = [[UIImageView alloc] init];
    self.ivAva.contentMode = UIViewContentModeScaleAspectFill;
    self.ivAva.translatesAutoresizingMaskIntoConstraints = NO;
    [self.infoView addSubview:self.ivAva];

    self.lblName = [[UILabel alloc] init];
    self.lblName.translatesAutoresizingMaskIntoConstraints = NO;
    [self.infoView addSubview:self.lblName];

    self.phoneNumberLabel = [[UILabel alloc] init];
    self.phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.infoView addSubview:self.phoneNumberLabel];

    self.onlineStatusLabel = [[UILabel alloc] init];
    self.onlineStatusLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.infoView addSubview:self.onlineStatusLabel];
    self.onlineStatusLabel.hidden = YES;
    self.onlineStatusLabel.font = [UIFont systemFontOfSize:12.f];

    self.bottomLine = [[UIView alloc] init];
    self.bottomLine.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.bottomLine];

    self.conversationBtn = [[UIButton alloc] init];
    self.conversationBtn.backgroundColor = [UIColor colorWithHexString:@"0099ff" alpha:1.f];
    self.conversationBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.conversationBtn setTitle:RCDLocalizedString(@"start_chat")
 forState:UIControlStateNormal];
    [self.conversationBtn addTarget:self
                             action:@selector(btnConversation:)
                   forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.conversationBtn];

    self.audioCallBtn = [[UIButton alloc] init];
    self.audioCallBtn.backgroundColor = [UIColor whiteColor];
    [self.audioCallBtn setTitle:RCDLocalizedString(@"voice_call")
 forState:UIControlStateNormal];
    //    [self.audioCallBtn setTintColor:[UIColor blackColor]];
    [self.audioCallBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.audioCallBtn addTarget:self action:@selector(btnVoIP:) forControlEvents:UIControlEventTouchUpInside];
    self.audioCallBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.audioCallBtn];

    self.videoCallBtn = [[UIButton alloc] init];
    self.videoCallBtn.backgroundColor = [UIColor whiteColor];
    [self.videoCallBtn setTitle:RCDLocalizedString(@"video_call")
 forState:UIControlStateNormal];
    [self.videoCallBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.videoCallBtn addTarget:self action:@selector(btnVideoCall:) forControlEvents:UIControlEventTouchUpInside];
    self.videoCallBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.videoCallBtn];

    self.subViews = NSDictionaryOfVariableBindings(_ivAva, _lblName, _onlineStatusLabel);
    [self setLayout];

    NSString *portraitUri;
    if (![self.userId isEqualToString:[RCIM sharedRCIM].currentUserInfo.userId]) {
        self.friendInfo = [[RCDataBaseManager shareInstance] getFriendInfo:self.userId];
        portraitUri = self.friendInfo.portraitUri;
        [self setLayoutForFriend];
        self.displayNameLabel = [[UILabel alloc] init];
    } else {
        portraitUri = [RCIM sharedRCIM].currentUserInfo.portraitUri;
        [self setLayoutForSelf];
    }
    if ([RCIM sharedRCIM].globalConversationAvatarStyle == RC_USER_AVATAR_CYCLE &&
        [RCIM sharedRCIM].globalMessageAvatarStyle == RC_USER_AVATAR_CYCLE) {
        self.ivAva.clipsToBounds = YES;
        self.ivAva.layer.cornerRadius = 30.f;
    } else {
        self.ivAva.clipsToBounds = YES;
        self.ivAva.layer.cornerRadius = 5.f;
    }
    if (portraitUri.length == 0) {
        DefaultPortraitView *defaultPortrait = [[DefaultPortraitView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        [defaultPortrait setColorAndLabel:self.friendInfo.userId Nickname:self.friendInfo.name];
        UIImage *portrait = [defaultPortrait imageFromView];
        self.ivAva.image = portrait;
    } else {
        [self.ivAva sd_setImageWithURL:[NSURL URLWithString:portraitUri]
                      placeholderImage:[UIImage imageNamed:@"icon_person"]];
    }

    __weak RCDPersonDetailViewController *weakSelf = self;
    [[RCIMClient sharedRCIMClient] getBlacklistStatus:self.friendInfo.userId
        success:^(int bizStatus) {
            weakSelf.inBlackList = (bizStatus == 0);

        }
        error:^(RCErrorCode status) {
            NSArray *array = [[RCDataBaseManager shareInstance] getBlackList];
            for (RCUserInfo *blackInfo in array) {
                if ([blackInfo.userId isEqualToString:weakSelf.friendInfo.userId]) {
                    weakSelf.inBlackList = YES;
                }
            }
        }];

    self.conversationBtn.layer.masksToBounds = YES;
    self.conversationBtn.layer.cornerRadius = 5.f;
    self.conversationBtn.layer.borderWidth = 0.5;
    self.conversationBtn.layer.borderColor = [HEXCOLOR(0x0181dd) CGColor];

    self.audioCallBtn.layer.masksToBounds = YES;
    self.audioCallBtn.layer.cornerRadius = 5.f;

    self.videoCallBtn.layer.masksToBounds = YES;
    self.videoCallBtn.layer.cornerRadius = 5.f;
}

- (void)setNavigationButtons {
    RCDUIBarButtonItem *leftButton = [[RCDUIBarButtonItem alloc] initWithLeftBarButton:RCDLocalizedString(@"back") target:self action:@selector(clickBackBtn:)];
    self.navigationItem.title = RCDLocalizedString(@"detailed_information");
}

- (void)clickBackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self displayOnlineStatus];

    if (![self.userId isEqualToString:[RCIM sharedRCIM].currentUserInfo.userId]) {
        NSString *remarks = self.friendInfo.displayName;
        if (remarks != nil && ![remarks isEqualToString:@""]) {
            [self setLayoutIsHaveRemarks:YES];
        } else {
            [self setLayoutIsHaveRemarks:NO];
        }
    }
}

- (void)btnConversation:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeTabBarIndex" object:@0];
    //创建会话
    RCDChatViewController *chatViewController = [[RCDChatViewController alloc] init];
    chatViewController.conversationType = ConversationType_PRIVATE;

    chatViewController.targetId = self.userId;
    NSString *title;
    if ([self.userId isEqualToString:[RCIM sharedRCIM].currentUserInfo.userId]) {
        title = [RCIM sharedRCIM].currentUserInfo.name;
    } else {
        if (self.friendInfo.displayName.length > 0) {
            title = self.friendInfo.displayName;
        } else {
            title = self.friendInfo.name;
        }
    }
    chatViewController.title = title;
    chatViewController.needPopToRootView = YES;
    chatViewController.displayUserNameInCell = NO;
    [self.navigationController pushViewController:chatViewController animated:YES];
}

- (void)btnVoIP:(id)sender {
    //语音通话
    [[RCCall sharedRCCall] startSingleCall:self.friendInfo.userId mediaType:RCCallMediaAudio];
}

- (void)btnVideoCall:(id)sender {
    //视频通话
    [[RCCall sharedRCCall] startSingleCall:self.friendInfo.userId mediaType:RCCallMediaVideo];
}

- (void)rightBarButtonItemClicked:(id)sender {

    if (self.inBlackList) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                                 delegate:self
                                                        cancelButtonTitle:RCDLocalizedString(@"cancel")

                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:RCDLocalizedString(@"cancel_block")
, nil];
        [actionSheet showInView:self.view];
    } else {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                                 delegate:self
                                                        cancelButtonTitle:RCDLocalizedString(@"cancel")

                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:RCDLocalizedString(@"add_to_blacklist")
, nil];
        [actionSheet showInView:self.view];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIActionSheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
    case 0: {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];

        //黑名单
        __weak RCDPersonDetailViewController *weakSelf = self;
        if (!self.inBlackList) {
            hud.labelText = RCDLocalizedString(@"adding_to_blacklist")
;
            [[RCIMClient sharedRCIMClient] addToBlacklist:self.friendInfo.userId
                success:^{
                    weakSelf.inBlackList = YES;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [hud hide:YES];
                    });
                    [[RCDataBaseManager shareInstance] insertBlackListToDB:weakSelf.friendInfo];

                }
                error:^(RCErrorCode status) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [hud hide:YES];
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                                            message:RCDLocalizedString(@"fail_to_add_to_blacklist")

                                                                           delegate:nil
                                                                  cancelButtonTitle:RCDLocalizedString(@"confirm")

                                                                  otherButtonTitles:nil, nil];
                        [alertView show];
                    });

                    weakSelf.inBlackList = NO;
                }];
        } else {
            hud.labelText = RCDLocalizedString(@"removing_from_blacklist")
;
            [[RCIMClient sharedRCIMClient] removeFromBlacklist:self.friendInfo.userId
                success:^{
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [hud hide:YES];
                    });
                    [[RCDataBaseManager shareInstance] removeBlackList:weakSelf.userId];

                    weakSelf.inBlackList = NO;
                }
                error:^(RCErrorCode status) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [hud hide:YES];
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                                            message:RCDLocalizedString(@"fail_to_remove_from_blacklist")

                                                                           delegate:nil
                                                                  cancelButtonTitle:RCDLocalizedString(@"confirm")

                                                                  otherButtonTitles:nil, nil];
                        [alertView show];
                    });

                    weakSelf.inBlackList = YES;
                }];
        }

    } break;
    }
}

- (void)setLayout {
    self.subViews = NSDictionaryOfVariableBindings(_ivAva, _lblName);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_ivAva(65)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_ivAva(65)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_ivAva
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_infoView
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1
                                                           constant:0]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_ivAva]-10-[_lblName]-10-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];
}

- (void)setLayoutForFriend {
    if ([[RCCallClient sharedRCCallClient] isAudioCallEnabled:ConversationType_PRIVATE]) {
        self.audioCallBtn.hidden = NO;
    } else {
        self.audioCallBtn.hidden = YES;
    }

    if ([[RCCallClient sharedRCCallClient] isVideoCallEnabled:ConversationType_PRIVATE]) {
        self.videoCallBtn.hidden = NO;
    } else {
        self.videoCallBtn.hidden = YES;
    }

    UIView *remarksView = [[UIView alloc] init];
    remarksView.translatesAutoresizingMaskIntoConstraints = NO;
    remarksView.userInteractionEnabled = YES;
    remarksView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:remarksView];

    UITapGestureRecognizer *clickRemarksView =
        [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoRemarksView:)];
    [remarksView addGestureRecognizer:clickRemarksView];

    UILabel *remarkLabel = [[UILabel alloc] init];
    remarkLabel.font = [UIFont systemFontOfSize:16.f];
    remarkLabel.textColor = [UIColor colorWithHexString:@"000000" alpha:1.f];
    remarkLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [remarksView addSubview:remarkLabel];
    remarkLabel.text = RCDLocalizedString(@"set_remarks")
;

    UIImageView *rightArrow = [[UIImageView alloc] init];
    rightArrow.translatesAutoresizingMaskIntoConstraints = NO;
    rightArrow.image = [UIImage imageNamed:@"right_arrow"];
    [remarksView addSubview:rightArrow];

    self.navigationItem.rightBarButtonItem =
        [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"config"]
                                         style:UIBarButtonItemStylePlain
                                        target:self
                                        action:@selector(rightBarButtonItemClicked:)];

    self.subViews =
        NSDictionaryOfVariableBindings(_infoView, _conversationBtn, remarksView, _audioCallBtn, _videoCallBtn);
    NSDictionary *remarksSubViews = NSDictionaryOfVariableBindings(remarkLabel, rightArrow);

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_infoView(85)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_conversationBtn(43)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_audioCallBtn(43)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_videoCallBtn(43)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_conversationBtn]-10-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_audioCallBtn]-10-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_videoCallBtn]-10-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];

    [self.view
        addConstraints:[NSLayoutConstraint
                           constraintsWithVisualFormat:@"V:[_infoView(85)]-15-[remarksView(43)]-15-[_conversationBtn]"
                                               options:0
                                               metrics:nil
                                                 views:self.subViews]];

    [self.view
        addConstraints:[NSLayoutConstraint
                           constraintsWithVisualFormat:@"V:[_conversationBtn]-15-[_audioCallBtn]-15-[_videoCallBtn]"
                                               options:0
                                               metrics:nil
                                                 views:self.subViews]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_infoView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[remarksView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:remarksView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_infoView
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1
                                                           constant:0]];

    [remarksView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[remarkLabel]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:remarksSubViews]];
    [remarksView addConstraint:[NSLayoutConstraint constraintWithItem:remarkLabel
                                                            attribute:NSLayoutAttributeCenterY
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:remarksView
                                                            attribute:NSLayoutAttributeCenterY
                                                           multiplier:1
                                                             constant:0]];

    [remarksView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[rightArrow]-10-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:remarksSubViews]];

    [remarksView addConstraint:[NSLayoutConstraint constraintWithItem:rightArrow
                                                            attribute:NSLayoutAttributeCenterY
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:remarksView
                                                            attribute:NSLayoutAttributeCenterY
                                                           multiplier:1
                                                             constant:0]];
}

- (void)setLayoutForSelf {
    if (self.constraintNameLabel != nil) {
        [self.infoView removeConstraints:self.constraintNameLabel];
    }
    self.videoCallBtn.hidden = YES;
    self.audioCallBtn.hidden = YES;
    self.subViews = NSDictionaryOfVariableBindings(_infoView, _conversationBtn);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_infoView(85)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_conversationBtn(43)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_conversationBtn]-10-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_infoView]-15-[_conversationBtn]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_infoView(85)]-15-[_conversationBtn]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_infoView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:self.subViews]];

    self.constraintNameLabel = @[ [NSLayoutConstraint constraintWithItem:self.lblName
                                                               attribute:NSLayoutAttributeCenterY
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.infoView
                                                               attribute:NSLayoutAttributeCenterY
                                                              multiplier:1
                                                                constant:0] ];

    [self.infoView addConstraints:[NSLayoutConstraint
                                      constraintsWithVisualFormat:@"H:[_onlineStatusLabel]-20-|"
                                                          options:0
                                                          metrics:nil
                                                            views:NSDictionaryOfVariableBindings(_onlineStatusLabel)]];

    [self.infoView addConstraint:[NSLayoutConstraint constraintWithItem:_onlineStatusLabel
                                                              attribute:NSLayoutAttributeCenterY
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.infoView
                                                              attribute:NSLayoutAttributeCenterY
                                                             multiplier:1
                                                               constant:0]];

    self.lblName.text = [RCIM sharedRCIM].currentUserInfo.name;
    [self.infoView addConstraints:self.constraintNameLabel];
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [self.view layoutIfNeeded];
}
- (void)setLayoutIsHaveRemarks:(BOOL)isHaveRemarks {
    if (self.constraintdisplayNameLabel != nil) {
        [self.infoView removeConstraints:self.constraintdisplayNameLabel];
    }

    [self setPhoneNumber];

    if (isHaveRemarks == YES) {
        self.displayNameLabel.hidden = NO;
        self.displayNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.displayNameLabel.font = [UIFont systemFontOfSize:16.f];
        self.displayNameLabel.textColor = [UIColor colorWithHexString:@"000000" alpha:1.f];
        self.displayNameLabel.text = self.friendInfo.displayName;
        [self.infoView addSubview:self.displayNameLabel];

        self.lblName.text = [NSString stringWithFormat:RCDLocalizedString(@"someone_nickname"), self.friendInfo.name];
        self.lblName.textColor = [UIColor colorWithHexString:@"999999" alpha:1.f];
        self.lblName.font = [UIFont systemFontOfSize:14.f];

        self.subViews = NSDictionaryOfVariableBindings(_displayNameLabel, _phoneNumberLabel, _lblName);

        [self.infoView addConstraint:[NSLayoutConstraint constraintWithItem:self.displayNameLabel
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.lblName
                                                                  attribute:NSLayoutAttributeLeft
                                                                 multiplier:1
                                                                   constant:0]];

        [self.infoView addConstraint:[NSLayoutConstraint constraintWithItem:self.phoneNumberLabel
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.lblName
                                                                  attribute:NSLayoutAttributeLeft
                                                                 multiplier:1
                                                                   constant:0]];

        self.constraintdisplayNameLabel = [NSLayoutConstraint
            constraintsWithVisualFormat:@"V:|-14-[_displayNameLabel]-5-[_phoneNumberLabel]-3-[_lblName]"
                                options:0
                                metrics:nil
                                  views:NSDictionaryOfVariableBindings(_displayNameLabel, _phoneNumberLabel, _lblName)];

        [self.infoView addConstraints:self.constraintdisplayNameLabel];

    } else {
        self.displayNameLabel.hidden = YES;

        self.lblName.text = self.friendInfo.name;
        self.lblName.font = [UIFont systemFontOfSize:16.f];
        self.lblName.textColor = [UIColor colorWithHexString:@"000000" alpha:1.f];

        self.subViews = NSDictionaryOfVariableBindings(_displayNameLabel, _phoneNumberLabel, _lblName);
        [self.infoView addConstraint:[NSLayoutConstraint constraintWithItem:self.phoneNumberLabel
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.lblName
                                                                  attribute:NSLayoutAttributeLeft
                                                                 multiplier:1
                                                                   constant:0]];
        self.constraintdisplayNameLabel = [NSLayoutConstraint
            constraintsWithVisualFormat:@"V:|-20-[_lblName(16)]-8-[_phoneNumberLabel(14)]"
                                options:0
                                metrics:nil
                                  views:NSDictionaryOfVariableBindings(_displayNameLabel, _phoneNumberLabel, _lblName)];

        [self.infoView addConstraints:self.constraintdisplayNameLabel];
    }
    [self.infoView addConstraints:[NSLayoutConstraint
                                      constraintsWithVisualFormat:@"H:[_phoneNumberLabel]-8-[_onlineStatusLabel]"
                                                          options:0
                                                          metrics:nil
                                                            views:NSDictionaryOfVariableBindings(_phoneNumberLabel,
                                                                                                 _onlineStatusLabel)]];

    [self.infoView addConstraint:[NSLayoutConstraint constraintWithItem:_onlineStatusLabel
                                                              attribute:NSLayoutAttributeCenterY
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:_phoneNumberLabel
                                                              attribute:NSLayoutAttributeCenterY
                                                             multiplier:1
                                                               constant:0]];

    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [self.view layoutIfNeeded];
}

- (void)setPhoneNumber {
    self.phoneNumberLabel.textColor = [UIColor colorWithHexString:@"999999" alpha:1.f];
    self.phoneNumberLabel.font = [UIFont systemFontOfSize:14.f];
    self.phoneNumberLabel.text = [NSString stringWithFormat:@"%@: --", RCDLocalizedString(@"mobile_number")];
    self.phoneNumberLabel.userInteractionEnabled = YES;
    self.phoneNumberLabel.hidden = YES;
    UITapGestureRecognizer *clickPhoneNumber =
        [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doCall:)];
    [AFHttpTool getFriendDetailsByIDV1:self.friendInfo.userId
                             success:^(id response) {
                                 if ([response[@"flag"] integerValue] == 1) {
                                     NSDictionary *dic = response[@"data"];
                                     NSDictionary *infoDic = dic;
                                   
                                     NSUInteger textLength = RCDLocalizedString(@"mobile_number").length + 1;
                                     //创建 NSMutableAttributedString
                                     NSMutableAttributedString *attributedStr =
                                         [[NSMutableAttributedString alloc] initWithString:self.phoneNumberLabel.text];
                                     [attributedStr addAttribute:NSForegroundColorAttributeName
                                                           value:[UIColor colorWithHexString:@"0099ff" alpha:1.f]
                                                           range:NSMakeRange(textLength, self.phoneNumberLabel.text.length-textLength)];
                                     self.phoneNumberLabel.attributedText = attributedStr;
                                     self.phonenumber =
                                         [NSString stringWithFormat:@"%@", [infoDic objectForKey:@"phone"]];
                                     [self.phoneNumberLabel addGestureRecognizer:clickPhoneNumber];
                                 }
                             }
                             failure:^(NSError *err){
                             }];
}

- (void)gotoRemarksView:(id)sender {
    RCDFrienfRemarksViewController *vc = [[RCDFrienfRemarksViewController alloc] init];
    vc.friendInfo = self.friendInfo;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)displayOnlineStatus {
    BOOL isDisplayOnlineStatus = [[NSUserDefaults standardUserDefaults] boolForKey:@"isDisplayOnlineStatus"];
    if (isDisplayOnlineStatus == YES) {
        // For Private Cloud Only ++
        //    [[RCIMClient sharedRCIMClient]
        //     getUserOnlineStatus:self.userId
        //     success:^(NSArray<RCUserOnlineStatusInfo *> *onlineStatusList) {
        //       NSMutableArray *statusList = [NSMutableArray new];
        //       NSString *status;
        //       if (onlineStatusList.count > 0) {
        //         for (RCUserOnlineStatusInfo *statusInfo in onlineStatusList) {
        //           [statusList addObject:@(statusInfo.platform)];
        //         }
        //         for (int i = 0; i < statusList.count; i++) {
        //           if ([statusList[i] intValue] == RCPlatform_PC || [statusList[i] intValue] == RCPlatform_Web) {
        //             status = @"电脑在线";
        //             break;
        //           }  else if ([statusList[i] intValue] == RCPlatform_iOS || [statusList[i] intValue] ==
        //           RCPlatform_Android) {
        //             status = @"手机在线";
        //           }
        //         }
        //       } else {
        //         status = @"离线";
        //       }
        //       dispatch_async(dispatch_get_main_queue(), ^{
        //         self.onlineStatusLabel.text = status;
        //         self.onlineStatusLabel.hidden = NO;
        //       });
        //     } error:^(RCErrorCode nErrorCode) {
        //
        //     }];
        // For Private Cloud Only --
    }
}

- (void)doCall:(id)sender {
    self.phoneNumberLabel.userInteractionEnabled = NO;
    [self performSelector:@selector(changePhoneNumberLabelInteractionEnabled) withObject:sender afterDelay:1];

    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"tel:%@", self.phonenumber];
    UIWebView *callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
}

- (void)changePhoneNumberLabelInteractionEnabled{
    self.phoneNumberLabel.userInteractionEnabled = YES;
}

@end
