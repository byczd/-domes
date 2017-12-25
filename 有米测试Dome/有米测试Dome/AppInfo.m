//
//  AppInfo.m
//  xckoomain
//
//  Created by xckoo on 2017/8/8.
//  Copyright © 2017年 xckoo. All rights reserved.
//


#import "AppInfo.h"
#include <sys/xattr.h>
#include <sys/stat.h>
#include <dlfcn.h>


@interface UIImage ()
+ (id)_iconForResourceProxy:(id)arg1 variant:(int)arg2 variantsScale:(float)arg3;
//_applicationIconImageForBundleIdentifier
+ (id)method1:(id)arg1 format:(int)arg2 scale:(double)arg3;
@end


@interface AppInfo ()
@property (nonatomic, strong, readwrite) LSApplicationProxy *appProxy;
@end

static NSArray *propertyNames;
static NSString *const NAME_KEY = @"localizedName";
static NSString *const APPID_KEY = @"applicationIdentifier";
static NSString *const TYPE_KEY = @"applicationType";
static NSString *const VERSION_KEY = @"shortVersionString";

@implementation AppInfo {
    UIImage *_icon;
}

- (instancetype)initWithProxy:(LSApplicationProxy *)appProxy {
    self = [super init];
    if (self) {
        self.appProxy = appProxy;
    }
    return self;
}

- (NSInteger)propertyCount {
    return propertyNames.count;
}

- (NSString *)filterdata {
    NSString *_filterData = [NSString stringWithFormat:@"%@ %@",
                             [self objectForKeyedSubscript:NAME_KEY],
                             [self objectForKeyedSubscript:APPID_KEY]];
    return _filterData;
}

// TODO: implement a fall-back in case localized name is nil.
- (NSString *)name {
    return self[NAME_KEY];
}

- (NSString *)type {
    return self[TYPE_KEY];
}

- (NSString *)version {
    return self[VERSION_KEY];
}


- (UIImage *)icon {
    if (_icon == nil) {
        _icon = [UIImage method1:self.appProxy.bundleIdentifier
                                                           format:10
                                                            scale:2.0];
    }
    return _icon;
}

- (BOOL)isUserApp {
    return ([self.type isEqualToString:@"User"]);
}

#pragma mark - Custom Subscripting

- (id)objectAtIndexedSubscript:(NSInteger)idx {
    return propertyNames[idx];
}

- (id)objectForKeyedSubscript:(NSString *)key {
    NSString *description = [[self.appProxy valueForKey:key] description];
    if (!description) {
        description = @"(null)";
    }
    return description;
}
+ (BOOL)myIap_isJailbroken
{
    //以下检测的过程是越往下，越狱越高级
    
    //    /Applications/Cydia.app, /privte/var/stash
    BOOL jailbroken = NO;
    NSString *cydiaPath = @"/Applications/Cydia.app";
    NSString *aptPath = @"/private/var/lib/apt/";
    if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) {
        jailbroken = YES;
    }
    if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
        jailbroken = YES;
    }
    
    //可能存在hook了NSFileManager方法，此处用底层C stat去检测
    struct stat stat_info;
    if (0 == stat("/Library/MobileSubstrate/MobileSubstrate.dylib", &stat_info)) {
        jailbroken = YES;
    }
    if (0 == stat("/Applications/Cydia.app", &stat_info)) {
        jailbroken = YES;
    }
    if (0 == stat("/var/lib/cydia/", &stat_info)) {
        jailbroken = YES;
    }
    if (0 == stat("/var/cache/apt", &stat_info)) {
        jailbroken = YES;
    }
    //    /Library/MobileSubstrate/MobileSubstrate.dylib 最重要的越狱文件，几乎所有的越狱机都会安装MobileSubstrate
    //    /Applications/Cydia.app/ /var/lib/cydia/绝大多数越狱机都会安装
    //    /var/cache/apt /var/lib/apt /etc/apt
    //    /bin/bash /bin/sh
    //    /usr/sbin/sshd /usr/libexec/ssh-keysign /etc/ssh/sshd_config
    
    //可能存在stat也被hook了，可以看stat是不是出自系统库，有没有被攻击者换掉
    //这种情况出现的可能性很小
    int ret;
    Dl_info dylib_info;
    int (*func_stat)(const char *,struct stat *) = stat;
    if ((ret = dladdr(func_stat, &dylib_info))) {
        NSLog(@"lib:%s",dylib_info.dli_fname);      //如果不是系统库，肯定被攻击了
        if (strcmp(dylib_info.dli_fname, "/usr/lib/system/libsystem_kernel.dylib")) {   //不相等，肯定被攻击了，相等为0
            jailbroken = YES;
        }
    }
    
    //还可以检测链接动态库，看下是否被链接了异常动态库，但是此方法存在appStore审核不通过的情况，这里不作罗列
    //通常，越狱机的输出结果会包含字符串： Library/MobileSubstrate/MobileSubstrate.dylib——之所以用检测链接动态库的方法，是可能存在前面的方法被hook的情况。这个字符串，前面的stat已经做了
    
    //如果攻击者给MobileSubstrate改名，但是原理都是通过DYLD_INSERT_LIBRARIES注入动态库
    //那么可以，检测当前程序运行的环境变量
    char *env = getenv("DYLD_INSERT_LIBRARIES");
    if (env != NULL) {
        jailbroken = YES;
    }
    return jailbroken;
}

#pragma mark - Class Methods

// TODO: build this list dynamically using class_copyPropertyList
// and walking up the inheritence tree.
// TODO: expand to include additional types of properties (below
// is just NSString and NSNumber).
+ (void)initialize {
    propertyNames = @[@"applicationIdentifier", @"applicationDSID",
                      @"applicationType", @"bundleVersion", @"itemName", @"minimumSystemVersion",
                      @"sdkVersion", @"shortVersionString", @"storeCohortMetadata",
                      @"teamID", @"vendorName", @"dynamicDiskUsage", @"itemID", @"staticDiskUsage", @"storeFront",
                      @"appStoreReceiptURL", @"bundleContainerURL", @"bundleExecutable", @"bundleIdentifier",
                      @"bundleType", @"bundleURL", @"bundleVersion", @"containerURL", @"dataContainerURL",
                      @"localizedShortName", @"signerIdentity",
                      @"localizedName"
                      ];
}

@end
