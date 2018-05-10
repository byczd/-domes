//
//  XGLoginCallbackModel.h
//  XGSDK
//
//  Created by wumeng on 2018/3/19.
//  Copyright © 2018年 wumeng. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum : NSUInteger{
    M_aiP_g = 1, //苹果支付
    M_aiOther = 0, //第三方
}M_aiType;

@interface XGLoginCallbackModel : NSObject
@property (nonatomic ,copy)NSString *userid;//uidinapp
@property (nonatomic ,copy)NSString *username;//uid
@property (nonatomic ,copy)NSString *session;//授权签名

/**
 说明：假如cp在不同支付模式下的商品id 不一样， 那么在购买商品的时候就得根据不同的支付类型，来传相应的商品id
 */
@property (nonatomic ,assign)M_aiType m_aiType;//支付方式

- (id)initContentWithDic:(NSDictionary *)jsonDic;

@property (nonatomic ,assign)BOOL isGsdgi;//忽略

@end
