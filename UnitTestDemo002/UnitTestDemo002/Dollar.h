//
//  Dollar.h
//  UnitTestDemo002
//
//  Created by wumeng on 2018/5/9.
//  Copyright © 2018年 wumeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Dollar : Money

+ (Dollar *)init:(CGFloat )number currency:(NSString *)currency;

@end
