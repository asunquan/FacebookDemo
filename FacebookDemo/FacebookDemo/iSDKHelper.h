//
//  iSDKHelper.h
//  FacebookDemo
//
//  Created by Suns孙泉 on 16/7/18.
//  Copyright © 2016年 cyou-inc.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class iSDKShareContent;

@interface iSDKHelper : NSObject

// 单例

+ (instancetype)sharedInstance;

// 链接应用程序委托

+ (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

+ (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation;

// facebook登陆

+ (void)facebookLoginSuccess:(void(^)(void))success
                      cancel:(void(^)(void))cancel
                     failure:(void(^)(NSError *error))failure;

// facebook分享

+ (void)facebookShareWithContent:(iSDKShareContent *)content
                         success:(void(^)(void))success
                          cancel:(void(^)(void))cancel
                         failure:(void(^)(NSError *error))failure;

// facebook邀请

+ (void)facebookInviteWithContent:(iSDKShareContent *)content
                          success:(void(^)(void))success
                           cancel:(void(^)(void))cancel
                          failure:(void(^)(NSError *error))failure;

// facebook游戏请求

+ (void)facebookRequestWithContent:(iSDKShareContent *)content
                           success:(void(^)(void))success
                            cancel:(void(^)(void))cancel
                           failure:(void(^)(NSError *error))failure;

// 好友列表

+ (void)facebookFriendsListSuccess:(void(^)(id result))success
                           failure:(void(^)(NSError *error))failure;

@end
