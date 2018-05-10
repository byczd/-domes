//
//  Franc.m
//  UnitTestDemo002
//
//  Created by wumeng on 2018/5/9.
//  Copyright © 2018年 wumeng. All rights reserved.
//

#import "Franc.h"

@implementation Franc


+ (Franc *)init:(CGFloat )number currency:(NSString *)currency{
    Franc *franc = [super init:number];
    franc.currency = currency;
    return franc;
}
- (Money *)times:(CGFloat)mulNumber{
    return [Money franc:self.amount*mulNumber];
}

@end
