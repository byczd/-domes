//
//  Money.m
//  UnitTestDemo002
//
//  Created by wumeng on 2018/5/9.
//  Copyright © 2018年 wumeng. All rights reserved.
//

#import "Money.h"
#import "Dollar.h"


@implementation Money
- (instancetype)initWithNuember:(CGFloat)number{
    self = [super init];
    if (self) {
        self.amount = number;
    }
    return self;
}

- (void)setAmount:(CGFloat)amount{
    //得到结果第二直接方式
    //_amount = 10;
    _amount = amount;
}

+ (instancetype)init:(CGFloat)number currency:(NSString *)currency{
    Money *money = [[[self class] alloc] initWithNuember:number];
    money.currency = currency;
    return money;
}

- (BOOL)equals:(id)objcet{
    //1. 首先伪实现
    //return true;
    Money *money = (Money *)objcet;
    
    //2.一般实现
    //return self.amount == money.amount && self.class == money.class;
    
    //3.
    return self.amount == money.amount && [self.currency isEqualToString:money.currency];
}

+ (Money *)dollar:(CGFloat)number{
    return [Money init:number currency:@"USD"];
}

+ (Money *)franc:(CGFloat)number{
    return [Money init:number currency:@"CHF"];
}


- (Money *)times:(CGFloat)mulNumber{
    return [Money init:self.amount*mulNumber currency:self.currency];
}


@end
