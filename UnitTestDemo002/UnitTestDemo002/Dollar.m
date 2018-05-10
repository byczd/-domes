
//
//  Dollar.m
//  UnitTestDemo002
//
//  Created by wumeng on 2018/5/9.
//  Copyright © 2018年 wumeng. All rights reserved.
//

#import "Dollar.h"

@implementation Dollar



+ (Dollar *)init:(CGFloat )number currency:(NSString *)currency{
    Dollar *dollar = [super init:number];
    dollar.currency = currency;
    return dollar;
}

- (Money *)times:(CGFloat)mulNumber{
    return [Money dollar:self.amount*mulNumber];
}



@end
