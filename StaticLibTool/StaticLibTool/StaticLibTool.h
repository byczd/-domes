//
//  StaticLibTool.h
//  StaticLibTool
//
//  Created by wumeng on 2018/1/4.
//  Copyright © 2018年 wumeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifdef DEBUG
#define SERVER_URL @"http://xgame.xckoo.com:8080"
#else
#define SERVER_URL @"http://sdk.xckoo.com:8080"
#endif

@interface StaticLibTool : NSObject
- (void)test;
@end
