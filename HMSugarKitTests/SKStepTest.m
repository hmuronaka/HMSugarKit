//
//  SKStepTest.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/08.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SKStep.h"

@interface SKStepTest : XCTestCase

@end

@implementation SKStepTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test5 {
    SKStep* step = [[SKStep alloc] initWithStep:5];
    XCTAssertEqual(step.step, 5);
    XCTAssertEqual([step sk_snap:0],    0);
    XCTAssertEqual([step sk_snap:1],    0);
    XCTAssertEqual([step sk_snap:2],    0);
    XCTAssertEqual([step sk_snap:2.4],  0);
    XCTAssertEqual([step sk_snap:2.5],  5);
    XCTAssertEqual([step sk_snap:3],    5);
    XCTAssertEqual([step sk_snap:5],    5);
    XCTAssertEqual([step sk_snap:7.49], 5);
    XCTAssertEqual([step sk_snap:7.5],  10);
    XCTAssertEqual([step sk_snap:10],   10);
    
    XCTAssertEqual([step sk_snap:-0],     0);
    XCTAssertEqual([step sk_snap:-1],     0);
    XCTAssertEqual([step sk_snap:-2],     0);
    XCTAssertEqual([step sk_snap:-2.49],  0);
    XCTAssertEqual([step sk_snap:-2.5],  -5);
    XCTAssertEqual([step sk_snap:-5],    -5);
    XCTAssertEqual([step sk_snap:-7.49], -5);
    XCTAssertEqual([step sk_snap:-7.5],  -10);
}

- (void)testMinus5 {
    SKStep* step = [[SKStep alloc] initWithStep:-5];
    XCTAssertEqual(step.step, -5);
    XCTAssertEqual([step sk_snap:0],    -0);
    XCTAssertEqual([step sk_snap:1],    -0);
    XCTAssertEqual([step sk_snap:2],    -0);
    XCTAssertEqual([step sk_snap:2.4],  -0);
    XCTAssertEqual([step sk_snap:2.5],  -5);
    XCTAssertEqual([step sk_snap:3],    -5);
    XCTAssertEqual([step sk_snap:5],    -5);
    XCTAssertEqual([step sk_snap:7.49], -5);
    XCTAssertEqual([step sk_snap:7.5],  -10);
    XCTAssertEqual([step sk_snap:10],   -10);
    
    XCTAssertEqual([step sk_snap:-0],    -0);
    XCTAssertEqual([step sk_snap:-1],    -0);
    XCTAssertEqual([step sk_snap:-2],    -0);
    XCTAssertEqual([step sk_snap:-2.49], -0);
    XCTAssertEqual([step sk_snap:-2.5],   5);
    XCTAssertEqual([step sk_snap:-5],     5);
    XCTAssertEqual([step sk_snap:-7.49],  5);
    XCTAssertEqual([step sk_snap:-7.5],   10);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
