//
//  NSArrayTest.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/10/26.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+HMSugarKit.h"

@interface NSArrayTest : XCTestCase

@end

@implementation NSArrayTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testVectorize {
    NSArray* nums = @[@1, @2, @3, @4, @5];
    
    SK_VECTORIZE funcs = [nums sk_vectorize:^id _Nonnull(id  _Nonnull obj) {
        return @([obj integerValue] * [obj integerValue]);
    }];
    
    NSArray* funcsResult = funcs(nums);
    
    NSArray* result = @[@1, @4, @9, @16, @25];
    
    XCTAssertTrue([funcsResult isEqualToArray:result]);
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
