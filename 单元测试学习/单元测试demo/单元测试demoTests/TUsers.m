//
//  TUsers.m
//  单元测试demoTests
//
//  Created by wumeng on 2018/5/4.
//  Copyright © 2018年 wumeng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "User.h"

@interface TUsers : XCTestCase{
    @private User *_user;
}

@end

@implementation TUsers

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _user = [[User alloc] init];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testExample {
    XCTAssertTrue([_user isChinese:@"吴萌"]);
    XCTAssertTrue([_user isChinese:@"132"]);
    
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    //XCTAssertTrue
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
