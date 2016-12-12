//
//  Constants.h
//  
//
//  Created by Chen XueFeng on 16/5/19.
//
//

#ifndef Constants_h
#define Constants_h

#import <Foundation/Foundation.h>

#pragma mark - micro defines
#define IsVip           ([[NSUserDefaults standardUserDefaults] boolForKey:kUserDefaultIsVip])
#define IsAdRemoved     ([[NSUserDefaults standardUserDefaults] boolForKey:kUserDefaultIsAdRemoved])
#define IsSharedToday   ([[NSUserDefaults standardUserDefaults] boolForKey:kUserDefaultIsSharedToday])

#define GetImage(Name, Ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(Name) ofType:(Ext)]]
#define GetFontAvenirNext(Size) [UIFont fontWithName:@"Avenir Next" size:(Size)]

#define StatusBarHeight       (20.f)
#define TopBarHeight          (44.f)
#define BottomBarHeight       (49.f)
#define CellDefaultHeight     (44.f)
#define EnglishKeyboardHeight (216.f)
#define ChineseKeyboardHeight (252.f)

#define MainScreenHeight      [[UIScreen mainScreen] bounds].size.height
#define MainScreenWidth       [[UIScreen mainScreen] bounds].size.width

#pragma mark - app id
extern NSString *const kAppReviewURL;
extern NSString *const kAppURL;

#pragma mark - privacy url
extern NSString *const kPrivacyURL;

#pragma mark - IAP
extern NSString *const kIAPAdRemoved;
extern NSString *const kIAPVip;

#pragma mark - leancould
extern NSString *const kLeanCloudApplicationId;
extern NSString *const kLeanClientKey;

#pragma mark - Share SDK
extern NSString *const kShareSDKApplicationId;

#pragma mark - WeiXin
extern NSString *const kWXApplicationId;
extern NSString *const kWXApplicationSecret;

#pragma mark - QQ
extern NSString *const kQQApplicationId;
extern NSString *const kQQApplicationSecret;

#pragma mark - Userdefault
extern NSString *const kUserDefaultFirstLaunch;
extern NSString *const kUserDefaultIsVip;
extern NSString *const kUserDefaultIsAdRemoved;
extern NSString *const kUserDefaultDailyNotification;
extern NSString *const kUserDefaultDailyNotificationStatus;

#pragma mark - Notification
extern NSString *const kNotificationVIPChanged;

#pragma mark - Admob
extern NSString *const kAdmobBannerID;
extern NSString *const kAdmobInterstitialId;

#endif /* Constants_h */
