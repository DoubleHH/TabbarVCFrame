//
//  GHDefines.h
//  Metting
//
//  Created by Hui  on 13-8-5.
//  Copyright (c) 2013年 yeyueshen. All rights reserved.
//

#ifndef Metting_GHDefines_h
#define Metting_GHDefines_h

// 需要引用的必要的头文件
//#import "NSString+LFCustom.h"
//#import "NSString+TextSize.h"
//#import "UIColor+ColorExplorer.h"
//#import "VSView+Extend.h"
//#import "HCBasicViewController.h"
//#import "HCUserModel.h"
//#import "HCUserManager.h"

// 分割线的颜色
#define ColorDivideLine [UIColor colorWithWhite:180.0/255.0f alpha:1.0]

// App的ID
#define AppStoreID @"839494324"
#define AppShowUrl @"http://www.jinlin.co"
#define AppStoreDownloadUrl [NSString stringWithFormat:@"http://itunes.apple.com/cn/app/id%@?mt=8", AppStoreID]
#define AppSupportEmail @"support@jinlin.co"
#define AppStoreCommentUrl  [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@", AppStoreID]

// Flurry ID
#define FlurryID @"C9P6J2FP4VQB7ZX333KH"

// Release
#define MSRelease(obj__) (obj__ = nil);
#define MSReleaseDelegate(obj__) (obj__.delegate = nil, obj__ = nil);
#define MSReleaseTableView(tableView__) (tableView__.delegate = nil, tableView__.dataSource = nil, tableView__ = nil);

// API url
#define APIURL(_action)  [NSString stringWithFormat:@"%@%@", @"http://115.28.155.108/neighborMakeFriends/0/app/?r=", _action] // Offline
//#define APIURL(_action)  [NSString stringWithFormat:@"%@%@", @"http://www.yangconghuiyi.com/conference/0/app/?r=", _action] // Online

// Code Server error
#define CodeSeverErrorNumber [NSNumber numberWithInt:19900109]

// Default
#define DEFAULTS [NSUserDefaults standardUserDefaults]
#define DEFAULT_NOTIFICATIONCENTER [NSNotificationCenter defaultCenter]

// Document Path
#define DOCUMENT_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

// 图片最高大小
#define CUSTOM_SIZE CGSizeMake(1024, 1024)

// Localizable
#define MSLocalizedString(str) NSLocalizedString(str,str)

// System Version
#define SYSTEM_VERSION ([[UIDevice currentDevice] systemVersion])

// Log
#ifdef DEBUG
#define MSLog(log, ...) NSLog(log, ## __VA_ARGS__)
#else
#define MSLog(log, ...)
#endif

// 屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
// 屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
// 是否是ios7及以上的系统
#define CheckIsIOS7 @"is_ios7"
#define IS_IOS7 ([DEFAULTS boolForKey:CheckIsIOS7])
// 是否是IPhone5的屏幕尺寸
#define IS_IPHONE5_SIZE ([UIScreen mainScreen].bounds.size.height > 480)

// Color
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

// Null To Nil
#define NULL_TO_NIL(__objc) ((id)[NSNull null] == (__objc) ? nil : (__objc))
// NSNumber To NSString
#define NUMBER_TO_STRING(__number) [NSString stringWithFormat:@"%@", __number ? __number : @"0"]

// Version string
#define VERSION_HEADER @"1"

// Requst Count in One Page, 每次网络请求的信息条数
#define RequstCountOnePage 20

// Notification
#define NotiLogin @"NotiLogin"
#define NotiLoginSuccess @"NotiLoginSuccess"
#define NotiContactChanged @"NotiContactChanged"
#define NotiDefaultHostChanged @"NotiDefaultHostChanged"
#define NotiConfChanged @"NotiConfChanged"
#define NotiLogout @"NotiLogout"
#define NotiConfNoticeCome @"NotiConfNoticeCome"
#define NotiDestoryedGroup @"NotiDestoryedGroup"
#define NotiLeavedGroup @"NotiLeavedGroup"

// 普通的UITableViewCell的高度
#define HeightOfCommonCell 30.0f

// 网络访问成功的标示
#define CodeSuccess 0
// 密码错误
#define CodePasswordWrong 102
// 注册用户存在的标示
#define CodeUserAlreadyExisted 105
// Token失效
#define CodeInvalidateToken 106
// 用户名不存在
#define CodeInvalidateName 120

// 通知
#define kPushP2PChat    @"kPushP2PChat"
#define kPushGroupChat  @"kPushGroupChat"
#define kPushNotiChat   @"kPushNotiChat"

/**
 _thumbnail, 图片缩略图的后缀
 **/

#define FontNormal [UIFont systemFontOfSize:15]

#endif

/**
 
 上线注意事项:
 1. BPushConfig.plist 修改PRODUCT_MODE
 
 **/
