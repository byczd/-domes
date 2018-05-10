//
//  MainTest.m
//  MainTest
//
//  Created by wumeng on 2018/5/9.
//  Copyright © 2018年 wumeng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Money.h"
#import "Dollar.h"


@interface MainTest : XCTestCase

@end

@implementation MainTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testMultiplication{
    Money *five = [Money dollar:5.f];
    NSLog(@"five class: %@",[five class]);
    five = [five times:2];
    NSLog(@"five class: %@",[five class]);
    XCTAssertEqual(five.amount, 10);
}

- (void)testMultiplication2{
    /*
    Dollar *five = [[Dollar alloc] initWithNuember:5.f];
    Dollar *product = [five times:2];
    XCTAssertEqual(10, product.amount);
    product = [five times:3];
    XCTAssertEqual(15, product.amount);
     */
    
    Money *five = [Money dollar:5.f];
    XCTAssertEqual(10, [five times:2].amount);
    XCTAssertEqual(15, [five times:3].amount);
}


- (void)testFrancMultiplication{
    Money *five = [Money franc:5.f];
    NSLog(@"five currency: %@",five.currency);
    Money *product = [five times:2];
    NSLog(@"product currency: %@",five.currency);
    XCTAssertEqual(10, product.amount);
    product = [five times:3];
    XCTAssertEqual(15, product.amount);
    
}


- (void)testEqulity{
    /*
    XCTAssertTrue([[Dollar init:5] equals:[Dollar init:5]]);
    XCTAssertFalse([[Dollar init:5] equals:[Dollar init:6.f]]);
    
    XCTAssertTrue([[Franc init:5] equals:[Franc init:5]]);
    XCTAssertFalse([[Franc init:5] equals:[Franc init:6.f]]);
    
    XCTAssertFalse([[Franc init:5] equals:[Dollar init:5]]);
     */
    
    //工厂方法
    XCTAssertTrue([[Money dollar:5.f] equals:[Money dollar:5.f]]);
    XCTAssertFalse([[Money dollar:5.f] equals:[Money dollar:6.f]]);
    XCTAssertFalse([[Money franc:5] equals:[Money dollar:5]]);
}

- (void)testCurrency{
    XCTAssertEqual(@"USD", [Money dollar:1].currency);
    XCTAssertEqual(@"CHF", [Money franc:1].currency);
}


- (void)testDifferentClassEquality{
    XCTAssertTrue([[Money init:10 currency:@"CHF"] equals:[Money init:10 currency:@"CHF"]]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        //test
        /*
        int sum = 0;
        for (int i=0; i<100; i++) {
            sum += i;
        }*/
    }];
}

@end
