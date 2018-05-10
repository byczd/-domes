//
//  Money.h
//  UnitTestDemo002
//
//  Created by wumeng on 2018/5/9.
//  Copyright © 2018年 wumeng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dollar;
@class Franc;


@interface Money : NSObject

+ (instancetype)init:(CGFloat)number;

- (instancetype)initWithNuember:(CGFloat)number;

- (BOOL)equals:(id)objcet;

@property (nonatomic ,assign)CGFloat amount;//结果
@property (nonatomic ,copy)NSString *currency;//货币


+ (Dollar *)dollar:(CGFloat)number;
+ (Franc *)franc:(CGFloat)number;

- (Money *)times:(CGFloat)mulNumber;



@end
