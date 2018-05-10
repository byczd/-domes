//
//  User.m
//  单元测试demo
//
//  Created by wumeng on 2018/5/4.
//  Copyright © 2018年 wumeng. All rights reserved.
//

#import "User.h"

@implementation User


- (BOOL)isChinese:(NSString *)string{
    //汉字的unicode范围是：0x4E00~0x9FA5
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:string];
}

@end
