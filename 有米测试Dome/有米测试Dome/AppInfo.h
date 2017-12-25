//
//  AppInfo.h
//  xckoomain
//
//  Created by xckoo on 2017/8/8.
//  Copyright © 2017年 xckoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSApplicationProxy.h"
#import "SSSoftwareLibrary.h"

@interface AppInfo : NSObject

@property (nonatomic, readonly) NSString *filterdata; // so we can build predicates for filtering
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *type;
@property (nonatomic, readonly) NSString *version;
@property (nonatomic, readonly) BOOL isUserApp;

@property (nonatomic, readonly) UIImage *icon;

- (instancetype)initWithProxy:(LSApplicationProxy *)appProxy;
- (NSInteger)propertyCount;
- (id)objectAtIndexedSubscript:(NSInteger)idx;
- (id)objectForKeyedSubscript:(NSString *)key;
+ (BOOL)myIap_isJailbroken;

@end

