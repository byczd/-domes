//
//  IPInfosManager.h
//  有米测试Dome
//
//  Created by wumeng on 2017/12/13.
//  Copyright © 2017年 wumeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IPInfosManager : NSObject
- (NSString *)getIPAddress:(BOOL)preferIPv4;
@end
