//
//  User.h
//  单元测试demo
//
//  Created by wumeng on 2018/5/4.
//  Copyright © 2018年 wumeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic ,copy)NSString *userName;//
@property (nonatomic ,copy)NSString *password;//密码

- (BOOL)isChinese:(NSString *)string;

@end
