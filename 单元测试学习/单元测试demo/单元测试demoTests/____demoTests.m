//___FILEHEADER___

#import <XCTest/XCTest.h>

@interface ___FILEBASENAMEASIDENTIFIER___ : XCTestCase

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

- (void)setUp {
    [super setUp];
    ///每个test方法执行前调用，在这个测试用例里进行一些通用的初始化工作
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    //每个test方法执行后调用
}

- (void)testExample {
    //测试方法样例
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    //这个方法主要是做性能测试的，所谓性能测试，主要就是评估一段代码的运行时间。该方法就是性能测试方法的样例。
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
