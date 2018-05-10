//
//  XGSDKManager.h
//  XGSDK
//
//  Created by wumeng on 2018/3/14.
//  Copyright © 2018年 wumeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "XGLoginCallbackModel.h"



@interface XGSDKManager : NSObject



/**
 获取SDKManager 对象
 @return XGSDKManager 对象
 */
+ (instancetype)manager;


/**
 XGSDK登录接口
 
 @param success 登录成功的回调，回调对象是 XGLoginCallbackModel 具体进行可进入XGLoginCallbackModel.h 查看
 @param failure 登录失败的回调 回调对象是NSError
 */
- (void)XGSDKloginWithSuccess:(void (^)(XGLoginCallbackModel *model))success
                      failure:(void (^)(id error))failure;


/**
 添加退出登录的回调
 @param successed success 初始化成功回调{logoutstatus:1}
 */
- (void)addLogoutCallBackSuccess:(void (^)(NSDictionary *successDict))successed;

/**
 初始化SDK

 @param appid appid
 @param appkey appkey
 @param adptId adptId(区分包的id)
 @param version 版本号
 @param success 初始化成功回调{initstatus:1}
 @param failure 初始化失败回调{initstatus:0, failureInfo:"具体的错误信息（类型可能是：NSString/NSError/NSDictionary）" }
 */
- (void)initSDKWithAppid:(NSString *)appid
                  appkey:(NSString *)appkey
                  adptId:(NSString *)adptId
                 version:(NSString *)version
                 success:(void (^)(NSDictionary *successDict))success
                 failure:(void (^)(NSDictionary *failureDict))failure;


/**
  SDK购买接口
 @param orderId 订单id
 @param productId 商品ID
 @param price 价格
 @param roleId 角色id
 @param descripe 商品描述
 @param attach 附加字符，可选
 @param success 支付成功回调{M_aiTstatus:1,orderId:xxxxx}
 @param failure 支付化失败回调{M_aiTstatus:0, failureInfo:"具体的错误信息（类型可能是：NSString/NSError/NSDictionary）" }
 */
- (void)XGSDKM_aiWithOrderId:(NSString *)orderId
                   productId:(NSString *)productId
                       price:(NSString *)price
                      roleId:(NSString *)roleId
                      attach:(NSString *)attach
                    describe:(NSString *)descripe
                     success:(void (^)(NSDictionary *successDict))success
                     failure:(void (^)(NSDictionary *failureDict))failure;




/**
 如cp方 在游戏内有切换账号需求，并且这个切换账号是指要SDK登录另外一个账号，则需要调用这方法。
 如无此需求，可忽略。
 游戏方主动调用SDK退出,这里SDK只做取消自动登录。 cp调用这个方法，再调用登录接口。
 */
- (void)cpCallSDKLogout;


/**
 是否已经登录
 @return YES: SDK已经登录  NO:SDK未登录
 */
- (BOOL)isLogined;


@end
