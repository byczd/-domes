//
//  ViewController.m
//  TestTakePrivateDemo
//
//  Created by wumeng on 2017/11/23.
//  Copyright © 2017年 wumeng. All rights reserved.
//

#import "ViewController.h"
#import <objc/NSObjCRuntime.h>
#import <objc/runtime.h>
#import <FMDB.h>
#import "Masonry.h"
//#import "BSSqliteDatabaseConnection.h"
#import <AdSupport/AdSupport.h>
#import "AppBunldeInfosSource.h"
#import "PDKeyChain.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //获取设置信息
//    AppBunldeInfosSource *infoSource = [AppBunldeInfosSource shareSource];
//    NSDictionary *resultDic = [infoSource getInfoOfDevice];
//    [infoSource synchronizationBundlesInfoWithKeyChain];
 
    
    [self test13];
}


- (void)test13{
    NSBundle *dundle = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/AppPredictionInternal.framework"];
    BOOL load = [dundle load];
    Class class = NSClassFromString(@"_ATXBundleIdSet");
    
    SEL sel = NSSelectorFromString(@"sharedInstance");
    NSObject *obj = [class performSelector:sel];
    
    BOOL result = [obj performSelector:@selector(containsBundleId:) withObject:@"com.xckoo.pigmoney"];
    
    //_length    unsigned long long    18
    //_capacity    unsigned long long    22
    NSLog(@"123");
    

}


- (void)test12{
    ///System/Library/PrivateFrameworks/AppleAccount.framework/AppleAccount
    //AADeviceInfo
    NSBundle *dundle3 = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/AppleAccount.framework"];
    BOOL load2 = [dundle3 load];
    Class class2 = NSClassFromString(@"AADeviceInfo");
    
    NSObject *obj1 = [class2 performSelector:@selector(userAgentHeader)];
    NSObject *obj2 = [class2 performSelector:@selector(productVersion)];
    NSObject *obj3 = [class2 performSelector:@selector(osVersion)];
    NSObject *obj4 = [class2 performSelector:@selector(infoDictionary)];
    NSObject *obj5 = [class2 performSelector:@selector(clientInfoHeader)];
    

    
//    @property(nonatomic,readonly,strong) NSString    *name;              // e.g. "My iPhone"
//    @property(nonatomic,readonly,strong) NSString    *model;             // e.g. @"iPhone", @"iPod touch"
//    @property(nonatomic,readonly,strong) NSString    *localizedModel;    // localized version of model
//    @property(nonatomic,readonly,strong) NSString    *systemName;        // e.g. @"iOS"
//    @property(nonatomic,readonly,strong) NSString    *systemVersion;     // e.g. @"4.0"

    
    
    UIDevice *device = [UIDevice currentDevice];
    NSString *name = device.name;
    NSString *model = device.model;
    NSString *localizedModel = device.localizedModel;
    NSString *systemName = device.systemName;
    NSString *systemVersion = device.systemVersion;

    NSLog(@"123");
}

- (void)test11{
    //拿到设备
    NSBundle *dundle3 = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/AuthKit.framework"];
    BOOL load2 = [dundle3 load];
    Class class2 = NSClassFromString(@"AKDevice");
    
    NSObject *currentDevice = [class2 performSelector:@selector(currentDevice)];
    
    
    NSBundle *dundle2 = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/AppConduit.framework"];
    BOOL load1 = [dundle2 load];
    Class class = NSClassFromString(@"ACXDeviceConnection");
    
    NSObject *obj = [class performSelector:@selector(sharedDeviceConnection)];
    
    //- (void)fetchInfoForApplicationWithBundleID:(id)arg1 completion:(id /* block */)arg2;

    void (^ completionBlock)(NSObject *) = ^(NSObject * result){
        NSLog(@"%@",result);
    };
    
    //fetchInstalledApplicationsForPairedDevice:completion:
    //-(void)fetchApplicationWithContainingApplicationBundleID:(id)arg1 completion:(/*^block*/ id)arg2 ;
    [obj performSelector:@selector(fetchApplicationWithContainingApplicationBundleID:completion:) withObject:@"com.xckoo.pigmoney" withObject:completionBlock];
    
    //[obj performSelector:@selector(fetchInstalledApplicationsForPairedDevice:completion:) withObject:currentDevice withObject:completionBlock];
}

- (void)test10{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
    });
    NSBundle *dundle2 = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/BaseBoard.framework"];
    BOOL load1 = [dundle2 load];
    Class class2 = NSClassFromString(@"BSSqliteDatabaseConnection");
    
    
    NSBundle *container = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/AppPredictionInternal.framework"];
    BOOL load2 = [container load];
    Class class = NSClassFromString(@"_ATXDataStore");
    
    NSString *path = @"/var/mobile/Library/DuetExpertCenter/_ATXDataStore.db";
    
    SEL selAlloc = NSSelectorFromString(@"alloc");
    NSObject *connection = [class2 performSelector:selAlloc];
    NSURL *fileURL = [NSURL URLWithString:path];
    
    NSBundle *container5 = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/AppPredictionInternal.framework"];
    BOOL isLoad5 = [container5 load];
    Class class5 = NSClassFromString(@"_ATXAppInfoManager");
    
    
    ////+ (int)_sqliteOpenFlagsForDataProtectionClass:(unsigned int)arg1;
    //NSInteger result = [class2 performSelector:@selector(_sqliteOpenFlagsForDataProtectionClass:) withObject:@(1048576)];
    
    
    
    for (unsigned int i = 0; i<4294967295; i++) {
        //"/var/mobile/Library/DuetExpertCenter/_ATXDataStore.db";
        NSInteger result = [class2 performSelector:@selector(_sqliteOpenFlagsForDataProtectionClass:) withObject:@(i)];
        connection = [connection performSelector:@selector(_initWithSqlitePath:dataProtectionClass:) withObject:path withObject:@(i)];
        if (connection != nil) {
            NSLog(@"%d",connection);
        }
    }

    connection = [connection performSelector:@selector(_initWithSqlitePath:dataProtectionClass:) withObject:path withObject:@(101)];
    NSLog(@"The obj %@ code is",connection);

    
    //BSSqliteDatabaseConnection *connection = [[BSSqliteDatabaseConnection alloc] initWithFileURL: dataProtectionClass:class];
    
    
   
    
    
    NSObject *obj = [class performSelector:@selector(sharedInstance)];
    
    BOOL openResult = [class2 performSelector:@selector(_sqliteOpenFlagsForDataProtectionClass:) withObject:obj];
    
    //AITransactionLog
    
    
    
    NSObject *obj3 = [obj performSelector:@selector(_databaseSchema)];
    NSObject *obj4 = [obj performSelector:@selector(configureDatabase)];
    
    
    //bundleWithPath
    NSObject *ob2j = [obj performSelector:@selector(appInfoForBundleId:) withObject:@"com.xckoo.pigmoney"];
    
    NSLog(@"%@",obj);
    
    //@"/var/mobile/Library/DuetExpertCenter/_ATXDataStore.db"
}


- (void)test9{
    NSBundle *container = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/MobileContainerManager.framework"];
    
    if ([container load]){
        Class appContainer = NSClassFromString(@"MCMAppContainer");
        
        NSObject *test = [appContainer performSelector:@selector(containerWithIdentifier:error:) withObject:@"com.xckoo.pigmoney" withObject:nil];
        //[self getAllMethodsWithClass:appContainer];
        [self getAllMethodsWithClass2:test];
        NSObject *info = [test performSelector:@selector(info)];
        BOOL isTem = [test performSelector:@selector(isTemporary) ];
        NSLog(@"%@",test);
        
        NSLog(@"is temp %d",isTem);
    }
    
    
}

- (void)test8{
    //PKPass
    NSBundle *container = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/PassKitCore.framework"];
    BOOL isLoad = [container load];
    
    Class class = NSClassFromString(@"PKContent");
    
    [self getAllMethodsWithClass:class];
    
    NSString *path = @"/var/mobile/Library/DuetExpertCenter/_ATXDataStore.db";
    NSObject *obj2 = [class performSelector:@selector(storeIdentifiers:) withObject:path];
    NSLog(@"%@",obj2);
    
    
    
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.left.mas_equalTo(20);
    }];
}

- (void)test7{
    //AppPredictionInternal.framework
    //_ATXAppInfo
    NSBundle *container = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/AppPredictionInternal.framework"];
    BOOL isLoad = [container load];
    
    Class class = NSClassFromString(@"_ATXAppInfoManager");
    //NSObject *objAlloc = [class alloc];
    //- (id)_getInfoOrCreateForBundleId:(id)arg1;
    NSObject *obj = [class performSelector:@selector(sharedInstance)];
    //NSObject *obj2 = [obj performSelector:@selector(allAppsWithInstallDate:) withObject:@"com.xckoo.pigmoney"];
    NSObject *obj2 = [obj performSelector:@selector(allAppsWithInstallDate)];
    if (obj == nil) {
        NSLog(@"未安装");
    }
    
    ///var/mobile/Library/DuetExpertCenter/_ATXDataStore.db
    //file:///private/var/containers/Bundle/Application/CB6E29D9-0371-40F5-B5E0-058039B719D8/-338935202298291612.app
    NSString *path = @"/var/mobile/Library/DuetExpertCenter/_ATXDataStore.db";
    
    NSFileManager *fileM = [NSFileManager defaultManager];
    NSArray *resultArry = [fileM subpathsAtPath:@"private"];
    //NSArray *resultArry2 = [fileM subpathsAtPath:@"/System/Library/PrivateFrameworks/"];
    //var/db/launchd.db
    //- (NSArray *)subpathsOfDirectoryAtPath:(NSString *)path error:(NSError **)error
    NSString *path2 = @"/var/db/launchd.db";
    
    
    NSData *data = [NSData dataWithContentsOfFile:path2];
    FMDatabase *fmdb = [[FMDatabase alloc] initWithPath:path2];
    BOOL resultOpen = [fmdb open];
    
    NSLog(@"%@",obj);
}

- (void)test6{
    NSBundle *container = [NSBundle bundleWithPath:@"/System/Library/Frameworks/MobileCoreServices.framework"];
    BOOL isLoad = [container load];
    
    
    Class class2 = NSClassFromString(@"LSApplicationWorkspace");
    NSObject *obj2 = [class2 performSelector:@selector(defaultWorkspace)];
    NSObject *obj3 = [obj2 performSelector:@selector(allApplications)];
    
    
    Class class = NSClassFromString(@"LSBundleProxy");
    NSObject *obj = [class performSelector:@selector(bundleProxyForIdentifier:) withObject:@"com.xckoo.pigmoney"];
    if (obj == nil) {
        NSLog(@"未安装");
    }
    
    NSLog(@"%@",obj);
    
    //1.来源id
    SEL sel = NSSelectorFromString(@"sourceAppIdentifier");
    if ([obj respondsToSelector:sel]) {
        id result =  [obj performSelector:sel];
        NSLog(@"%@",result);
    }
    
    //2.是否正在安装
    SEL sel2 = NSSelectorFromString(@"isPlaceholder");
    if ([obj respondsToSelector:sel2]) {
        BOOL result =  [obj performSelector:sel2];
        NSLog(@"%ld",result);
    }
    
    
    //3.安装时间
    SEL sel3 = NSSelectorFromString(@"registeredDate");
}


- (void)test5{
    NSBundle *container = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/MobileContainerManager.framework"];
    BOOL isLoad = [container load];
    Class appContainer = NSClassFromString(@"MCMAppContainer");
    NSLog(@"123");
}


- (void)test4{
    Class class = NSClassFromString(@"_LSIconCacheService");
    NSObject *obj = [class performSelector:@selector(sharedInstance)];
    SEL sel = NSSelectorFromString(@"invalidateItemsForBundleIdentifier:");
    if ([obj respondsToSelector:sel]) {
        
        id result =  [obj performSelector:@selector(invalidateItemsForBundleIdentifier:) withObject:@"com.xckoo.pigmoney"];
        NSLog(@"%@",result);
    }
}


- (void)test3{
    //APRBundleSetFilter
    Class class = NSClassFromString(@"LSBundleProxy");
    Class class2 = NSClassFromString(@"_LSAllURLSchemesQuery");
//    Class class = objc_getClass("MBAppManager");
    

    
    
    //NSString *path = [class performSelector:@selector(defaultPath)];
    NSObject *obj = [class performSelector:@selector(bundleProxyForIdentifier:) withObject:@"com.xckoo.pigmoney"];
                                //withObject:@"com.xckoo.pigmoney"];
    
    [self getAllMethodsWithClass:class];
    //(MessageSendTest *(*)(id,SEL))
   
    //NSLog(@"6. return value is %d", returnInt);
    
    
    
    
    //SEL sel = NSSelectorFromString(@"invalidateItemsForBundleIdentifier:");
    SEL sel = NSSelectorFromString(@"isContainerized");
    if ([obj respondsToSelector:sel]) {
        
        id result =  [obj performSelector:sel];
        NSLog(@"%@",result);
    }

}

-(NSArray *)getAllMethodsWithClass2:(NSObject * )obj
{
    unsigned int count_f =0;
    //获取方法链表
    Method* methodList_f = class_copyMethodList([obj class],&count_f);
    
    NSMutableArray *methodsArray = [NSMutableArray arrayWithCapacity:count_f];
    
    for(int i=0;i<count_f;i++)
    {
        Method temp_f = methodList_f[i];
        //方法的调用地址
        IMP imp_f = method_getImplementation(temp_f);
        //方法
        SEL name_f = method_getName(temp_f);
        //方法名字符串
        const char* name_s =sel_getName(method_getName(temp_f));
        //参数数量
        int arguments = method_getNumberOfArguments(temp_f);
        //返回方法的参数和返回值的描述的字串
        const char* encoding =method_getTypeEncoding(temp_f);
        NSLog(@"方法名：%@,参数个数：%d,编码方式：%@",[NSString stringWithUTF8String:name_s],
              arguments,[NSString stringWithUTF8String:encoding]);
        
        NSString *methodStr = NSStringFromSelector(name_f);
        [methodsArray addObject:methodStr];
        
    }
    free(methodList_f);
    
    return methodsArray;
}


-(NSArray *)getAllMethodsWithClass:(Class )class
{
    unsigned int count_f =0;
    //获取方法链表
    Method* methodList_f = class_copyMethodList(class,&count_f);
    
    NSMutableArray *methodsArray = [NSMutableArray arrayWithCapacity:count_f];
    
    for(int i=0;i<count_f;i++)
    {
        Method temp_f = methodList_f[i];
        //方法的调用地址
        IMP imp_f = method_getImplementation(temp_f);
        //方法
        SEL name_f = method_getName(temp_f);
        //方法名字符串
        const char* name_s =sel_getName(method_getName(temp_f));
        //参数数量
        int arguments = method_getNumberOfArguments(temp_f);
        //返回方法的参数和返回值的描述的字串
        const char* encoding =method_getTypeEncoding(temp_f);
        NSLog(@"方法名：%@,参数个数：%d,编码方式：%@",[NSString stringWithUTF8String:name_s],
              arguments,[NSString stringWithUTF8String:encoding]);
        
        NSString *methodStr = NSStringFromSelector(name_f);
        [methodsArray addObject:methodStr];
        
    }
    free(methodList_f);
    
    return methodsArray;
}

- (void)test2{
    //_ATXAppLaunchHistogramInterface
    
    //func class_addProtocol(_ cls: AnyClass?,
    //_ protocol: Protocol) -> Bool
    
//    SEL select = NSSelectorFromString(@"class_addProtocol");
//    [self performSelector:select withObject:@[self,@"_ATXAppLaunchHistogramInterface"]];
    
    //_LSApplicationState
//    Class class = objc_getClass("LSApplicationProxy");
//    NSObject *applicationProxy = [class performSelector:@selector(applicationProxyForIdentifier:) withObject:@"com.xckoo.pigmoney"];
//    BOOL isNewstand = [applicationProxy performSelector:@selector(isNewsstandApp)];
//    NSLog(@"%@",applicationProxy);

    Class class = objc_getClass("LSApplicationRestrictionsManager");
//    NSObject *obj = [class performSelector:@selector(sharedInstance)];
//    BOOL result = [obj performSelector:@selector(isApplicationRemoved:) withObject:@"com.xckoo.pigmoney"];
////    BOOL isNewstand = [applicationProxy performSelector:@selector(isNewsstandApp)];
//    NSLog(@"%@",result);
}

- (void)getInstallingBundleIDs{
    NSMutableArray *app = [NSMutableArray array];
    //获得私有的类
    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
    NSObject *workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
    
    
    //获得所有的正在安装的app,得到的是个数组
    NSArray *apps = [workspace performSelector:@selector(placeholderApplications)];
    //NSLog(@"%@",apps);
    //"<LSApplicationProxy: 0x16e75300> com.xckoo.pigmoney file:///private/var/containers/Bundle/Application/7174E80C-3B99-429C-9F59-DB29A569CF04/-8196065558782499901.app <com.xckoo.pigmoney <placeholder >>"
    // "<LSApplicationProxy: 0x146637f0> com.xckoo.pigmoney file:///private/var/containers/Bundle/Application/CB6E29D9-0371-40F5-B5E0-058039B719D8/-338935202298291612.app <com.xckoo.pigmoney <placeholder >>"
    
    
    
    Protocol *pro = NSProtocolFromString(@"_ATXAppLaunchHistogramInterface");
    BOOL isConforms = [workspace conformsToProtocol:pro];
    
    
    //removedSystemApplications 系统移除
    NSArray *apps2 = [workspace performSelector:@selector(unrestrictedApplications)];
    //NSLog(@"%@",apps2);
    
    NSArray *apps3 = [workspace performSelector:@selector(allApplications)];
    //NSLog(@"%@",apps3);
    
    //allInstalledApplications
    NSArray *apps4 = [workspace performSelector:@selector(allInstalledApplications)];
    
    
    Class LSApplicationProxy_class = objc_getClass("LSApplicationProxy");
    

    //遍历数组，根据app的名称判断哪个app正在安装
    for (int i = 0; i < apps3.count; i++) {
        NSObject *temp = apps3[i];
        if ([temp isKindOfClass:LSApplicationProxy_class]) {
            NSString *appName = [temp performSelector:NSSelectorFromString(@"localizedName")];
            BOOL b  = [temp performSelector:NSSelectorFromString(@"isPlaceholder")];
            
            //LSResourceProxy
            Class LSResourceProxy_class = objc_getClass("LSResourceProxy");
            if ([temp isKindOfClass:LSResourceProxy_class]) {
                NSString *bunldeId = [temp performSelector:NSSelectorFromString(@"boundApplicationIdentifier")];
                BOOL isNewstand = [temp performSelector:@selector(isInstalled)];
                if (isNewstand) {
                    NSLog(@"BundleID !!!!!! %@",bunldeId);
                }
                NSString *bunldeId2 = [temp performSelector:NSSelectorFromString(@"sourceAppIdentifier")];
                NSLog(@"%@",bunldeId2);
            }
            
            NSLog(@"名称：%@++++%d",appName,b);
        }
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (![PDKeyChain keyChainLoad]) {
        NSLog(@"keyChain load fail");
    }else {
        NSLog(@"keyChain load success: %@ ",[PDKeyChain keyChainLoad]);
    }
    
}

@end
