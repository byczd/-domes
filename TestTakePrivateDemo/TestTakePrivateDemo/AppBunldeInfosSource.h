//
//  AppBunldeInfosSource.h
//  TestTakePrivateDemo
//
//  Created by wumeng on 2017/11/24.
//  Copyright © 2017年 wumeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppBunldeInfosSource : NSObject

+ (instancetype)shareSource;


/**
 获取设备信息，iOS 10 及以下能够使用

 @return dic
 */
- (NSDictionary *)getInfosWihtId; // bundleId

//- (_Bool)isAppStoreInstalledWithIdentifier:(NSString *)arg1;
//- (_Bool)isAppStoreInstalledWithIdentifier:(NSString *)arg1;
//- (_Bool)isNowInstalledWithIdentifier:(NSString *)arg1;


/**
 把手机上所有已安装app 的信息存储到keyChain
 */
- (void)synchronizationBundlesInfoWithKeyChain;
/**
 获取手机设备的信息

 @return 字典
 */
- (NSDictionary *)getInfoOfDevice;

@end
