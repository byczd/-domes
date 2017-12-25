//
//  AppBunldeInfosSource.m
//  TestTakePrivateDemo
//
//  Created by wumeng on 2017/11/24.
//  Copyright © 2017年 wumeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppBunldeInfosSource.h"
#import <objc/runtime.h>
#import "UAObfuscatedString.h"
#import <sys/utsname.h>
#import "PDKeyChain.h"

@implementation AppBunldeInfosSource

+ (instancetype)shareSource{
    static AppBunldeInfosSource *appBundleInfosSources = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appBundleInfosSources = [[AppBunldeInfosSource alloc] init];
        
    });
    return appBundleInfosSources;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self checkKeyChain];
    }
    return self;
}

- (NSDictionary *)getInfosWihtBunldeId{
    NSDictionary *returnDic = [NSMutableDictionary dictionary];
    return returnDic;
}

- (NSDictionary *)getInfosWihtId{
    return nil;
}

- (void)synchronizationBundlesInfoWithKeyChain{
    
    // 1.
    
    NSString *classStr = NSMutableString.string.L.S.A.p.p.l.i.c.a.t.i.o.n.W.o.r.k.s.p.a.c.e;
    Class class = NSClassFromString(classStr);
    NSString *selStr = NSMutableString.string.d.e.f.a.u.l.t.W.o.r.k.s.p.a.c.e;
    SEL sel = NSSelectorFromString(selStr);
    NSObject *wrSpace = [class performSelector:sel];
    
    NSString *sel1Str = NSMutableString.string.a.l.l.A.p.p.l.i.c.a.t.i.o.n.s;
    SEL sel1 = NSSelectorFromString(sel1Str);
    NSArray *apps = [wrSpace performSelector:sel1];

    
    NSMutableArray *bundlesArray = [NSMutableArray array];
    for (NSObject *item in apps) {
        NSMutableDictionary *bundleIdDic = [NSMutableDictionary dictionary];
        //1.来源id
        NSMutableString *selStr = NSMutableString.string.s.o.u.r.c.e.A.p.p.I.d.e.n.t.i.f.i.e.r;
        SEL sel = NSSelectorFromString(selStr);
        if ([item respondsToSelector:sel]) {
            NSString *source =  [item performSelector:sel];
            NSLog(@"source is : %@",source);
            
            if (source != nil) {
                [bundleIdDic setValue:source forKey:@"source"];
            }
        }
        
        //2.是否正在安装
//        SEL sel2 = NSSelectorFromString(@"isPlaceholder");
//        if ([item respondsToSelector:sel2]) {
//            BOOL result =  [item performSelector:sel2];
//            NSLog(@"is installing %ld",result);
//        }
        
        NSMutableString *sel3Str = NSMutableString.string.b.o.u.n.d.A.p.p.l.i.c.a.t.i.o.n.I.d.e.n.t.i.f.i.e.r;
        SEL sel3 = NSSelectorFromString(sel3Str);
        if ([item respondsToSelector:sel3]) {
            NSString *bundleId  =  [item performSelector:sel3];
            NSLog(@"bundle id: %@",bundleId);
            [bundleIdDic setValue:bundleId forKey:@"bundleId"];
        }
        
        [bundlesArray addObject:bundleIdDic];
    }
    
    [PDKeyChain keyChainSave:bundlesArray];
}

- (void)checkKeyChain {
    if (![PDKeyChain keyChainLoad]) {
        NSLog(@"keyChain check: exist");
    }else {
        NSLog(@"keyChain check: absent");
    }
}



- (NSDictionary *)getInfoOfDevice{
    NSMutableDictionary *returnDic = [NSMutableDictionary dictionary];
    NSBundle *dundle = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/AppleAccount.framework"];
    BOOL load = [dundle load];
    if (load == NO) {
        return returnDic;
    }
    
    NSMutableString *classStr = NSMutableString.string.A.A.D;
    [classStr appendString:@"eviceInfo"];
    Class class = NSClassFromString(classStr);
    
    NSDictionary *infoDic = [class performSelector:@selector(infoDictionary)];
    NSMutableString *reCokey = NSMutableString.string.r.e;//regionCode
    [reCokey appendString:@"gionCode"];
    if ([[infoDic allKeys] containsObject:reCokey]) {
        NSString *result = [infoDic valueForKey:reCokey];
        [returnDic setObject:result forKey:reCokey ];
    }
    NSString *infoOfHeader = [class performSelector:@selector(clientInfoHeader)];
    NSArray *infos = [infoOfHeader componentsSeparatedByString:@"> <"];
    if (infos.count < 2) {
        return returnDic;
    }
    
    NSString *localizedModel = [UIDevice currentDevice].localizedModel;
    [returnDic setObject:localizedModel forKey:@"localizedModel"];
    
    NSString *iPhoneType = [self deviceVersion];
    [returnDic setObject:iPhoneType forKey:@"mobileType"];
    
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    [returnDic setObject:systemVersion forKey:@"systemVersion"];
    
    NSString *name = [UIDevice currentDevice].name;
    [returnDic setObject:name forKey:@"name"];
    
    return returnDic;
}

- (NSString*)deviceVersion{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    //iPhone
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone9,1"] || [deviceString isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,2"] || [deviceString isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone10,1"] || [deviceString isEqualToString:@"iPhone10,4"])    return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,2"] || [deviceString isEqualToString:@"iPhone10,5"])    return @"iPhone 8 Plus";
    if ([deviceString isEqualToString:@"iPhone10,3"] || [deviceString isEqualToString:@"iPhone10,6"])    return @"iPhone X";
    
    return deviceString;
}
                      
                      
@end
