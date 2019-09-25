//
//  RCDSquareTableViewController.m
//  RCloudMessage
//
//  Created by Jue on 16/4/1.
//  Copyright © 2016年 RongCloud. All rights reserved.
//

#import "RCDSquareTableViewController.h"
#import "RCDBaseSettingTableViewCell.h"
#import "RCDChatViewController.h"
#import "RCDCommonDefine.h"
#import "RCDHttpTool.h"
#import "RCDSquareCell.h"
#import <Flutter/Flutter.h>
#import "AppDelegate.h"
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>
#import <FlutterBoost.h>
#import <FLBFlutterViewContainer.h>
#import "RCDSettingUserDefaults.h"
#import "XZQRCodeController.h"
#import "QRBean.h"
#import "RCDPersonDetailViewController.h"
#import "AFHttpTool.h"
#import "RCDAddFriendViewController.h"
#import "UserInfoBean.h"
#import <CoreImage/CoreImage.h>
#import <UIKit/UIKit.h>
#import "QRViewController.h"

@interface RCDSquareTableViewController ()<FlutterStreamHandler,XZQRCodeDelegate>

@end

@implementation RCDSquareTableViewController {
    NSMutableArray *chatRoomIdList;
    NSMutableArray *chatRoomNames;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    chatRoomNames = [NSMutableArray new];
    chatRoomIdList = [NSMutableArray new];

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *squareInfoList = [userDefaults mutableArrayValueForKey:@"SquareInfoList"];
    for (NSDictionary *info in squareInfoList) {
        NSString *type = info[@"type"];
        if ([type isEqualToString:@"chatroom"]) {
            [chatRoomIdList addObject:info[@"id"]];
            [chatRoomNames addObject:info[@"name"]];
        }
    }
    if (chatRoomIdList.count > 0) {
        [self.tableView reloadData];
    }
  
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.tabBarController.navigationItem.title = RCDLocalizedString(@"discover");
    self.tabBarController.navigationItem.rightBarButtonItems = nil;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillAppear:animated];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    NSArray *chatroomIcons = [[NSArray alloc] initWithObjects:@"icon_1-1", @"icon_2-1", @"icon_3-1", @"icon_4-1", nil];

    static NSString *reusableCellWithIdentifier = @"RCDSquareCell";
    RCDSquareCell *cell = [self.tableView dequeueReusableCellWithIdentifier:reusableCellWithIdentifier];

    if (cell == nil) {
        switch (indexPath.row) {
                case 0:
                cell = [[RCDSquareCell alloc] initWithIconName:[NSString stringWithFormat:@"%@", chatroomIcons[indexPath.row]]
                                                     TitleName:RCDLocalizedString(@"share_life")];
                break;
                case 1:
                cell = [[RCDSquareCell alloc] initWithIconName:[NSString stringWithFormat:@"%@", chatroomIcons[indexPath.row]]
                                                     TitleName:@"小背篓"];
                break;
            case 2:
            cell = [[RCDSquareCell alloc] initWithIconName:[NSString stringWithFormat:@"%@", chatroomIcons[indexPath.row]]
                                                 TitleName:@"扫一扫"];
            break;
            case 3:
            cell = [[RCDSquareCell alloc] initWithIconName:[NSString stringWithFormat:@"%@", chatroomIcons[indexPath.row]]
                                                 TitleName:@"我的二维码"];
            break;
            default:
                break;
        }
        
    }
    return cell;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionHeaderView =
        [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 35.5)];
    sectionHeaderView.backgroundColor = HEXCOLOR(0xf0f0f6);
    UIView *line =
        [[UIView alloc] initWithFrame:CGRectMake(0, 35.5 - 0.5, [[UIScreen mainScreen] bounds].size.width, 0.5)];
    line.backgroundColor = HEXCOLOR(0xdfdfdf);
    [sectionHeaderView addSubview:line];

    UILabel *Title = [[UILabel alloc] initWithFrame:CGRectMake(9, (35.5 - 20) / 2.0, 200, 20)];
    [Title setTextColor:HEXCOLOR(0x000000)];
    [Title setFont:[UIFont systemFontOfSize:16.f]];

    [sectionHeaderView addSubview:Title];
    switch (section) {
    case 0:
        Title.text = RCDLocalizedString(@"chatroom");
        break;
    default:
        break;
    }
    return sectionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 68.5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}
FlutterViewController *flutterViewController;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
  
    switch (indexPath.row) {
        case 0:{
            
            NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                               [RCDSettingUserDefaults getUserDevice], @"device",
                                               [RCDSettingUserDefaults getUserToken], @"token", nil];
            FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
            [vc setName:@"share" params:mutableDic];
            [self.navigationController pushViewController:vc animated:YES];
            [self.navigationController setNavigationBarHidden:YES];
            break;
        }
           
        case 1:
            
          [RCKitUtility openURLInSafariViewOrWebView:[NSString stringWithUTF8String:"http://www.zjnbxbl.com"] base:self];
            break;
        case 2:{
            XZQRCodeController *scan = [[XZQRCodeController alloc] init];
            scan.delegate = self;
            [self.navigationController pushViewController:scan animated:YES];
            
            break;
        }
        case 3:{
            QRViewController *qrView = [[QRViewController alloc] init];
            qrView.target = @"http://baidu.com";
            [self.navigationController pushViewController:qrView animated:YES];
       
            break;
        }
        
        default:
            break;
    }
    
    


}
    
   
    

 
    
    - (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
    {
        if (jsonString == nil) {
            return nil;
        }
        
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        if(err)
        {
            NSLog(@"json解析失败：%@",err);
            return nil;
        }
        return dic;
    }

    
- (void)XZQRCodeScanWithResult:(NSString *)result{
    
    NSLog(@"result = %@",result);
    
    QRBean *qrBean  = [QRBean new];

    id jsonObj = [self dictionaryWithJsonString:result];
    
    [qrBean setValuesForKeysWithDictionary:jsonObj];
    
   
    
    if(qrBean.status == 1){
        
    }else{
        [AFHttpTool getFriendDetailsByIDV1:qrBean.title
                                   success:^(id response) {
                                       if ([response[@"flag"] integerValue] == 1) {
                                           if ([response[@"code"] integerValue] == 2) {
                                               
                                           }else if([response[@"code"] integerValue] == 3){
                                               
                                           }else if([response[@"code"] integerValue] == 4){
                                               
                                           }else if([response[@"code"] integerValue] == 5){
                                               
                                           }else{
//                                               RCDPersonDetailViewController *temp = [[RCDPersonDetailViewController alloc] init];
//                                               temp.userId = qrBean.title;
//                                               dispatch_async(dispatch_get_main_queue(), ^{
//                                                   [self.navigationController pushViewController:temp animated:YES];
//                                               });
                                               
                                               RCDAddFriendViewController *addViewController =
                                               
                                               [[RCDAddFriendViewController alloc] init];
                                               
                                               RCUserInfo *user = [RCUserInfo new];
                                               UserInfoBean *info = [UserInfoBean new];
                                               [info setValuesForKeysWithDictionary:response[@"data"]];
                                               
                                               user.userId = info.id;
                                               user.name = info.nickname;
                                               user.portraitUri = info.pic;
                                               
                                               addViewController.targetUserInfo = user;
                                               
                                               [self.navigationController
                                                
                                                pushViewController:addViewController
                                                
                                                animated:YES];
                                           }
                                           
                                       }
                                   }
                                   failure:^(NSError *err){
                                   }];
    }
    
    
    NSLog(@"result = %@",qrBean.title);
}


#pragma mark - <FlutterStreamHandler>
// // 这个onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体。
- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(FlutterEventSink)events {
    // arguments flutter给native的参数
    // 回调给flutter， 建议使用实例指向，因为该block可以使用多次
    if (events) {
        events(@"login");
    }
    return nil;
}

/// flutter不再接收
- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    // arguments flutter给native的参数
    NSLog(@"%@", arguments);
    return nil;
}

@end
