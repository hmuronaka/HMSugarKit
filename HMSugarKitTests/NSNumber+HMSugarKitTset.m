//
//  NSNumber+HMSugarKitTset.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/09/29.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSNumber+HMSugarKit.h"

@interface NSNumber_HMSugarKitTset : XCTestCase

@property(nonatomic, strong) NSNumber* value;

@end

@implementation NSNumber_HMSugarKitTset

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.value = @5;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIncrement {
    
    XCTAssertEqualObjects([self.value sk_incrementChar], [NSNumber numberWithChar:6]);
    XCTAssertEqualObjects([self.value sk_incrementShort], [NSNumber numberWithShort:6]);
    XCTAssertEqualObjects([self.value sk_incrementInt], [NSNumber numberWithInt:6]);
    XCTAssertEqualObjects([self.value sk_incrementLong], [NSNumber numberWithLong:6]);
    XCTAssertEqualObjects([self.value sk_incrementLongLong], [NSNumber numberWithLongLong:6]);
    
}

- (void)testDecrement {
    
    XCTAssertEqualObjects([self.value sk_decrementChar], [NSNumber numberWithChar:4]);
    XCTAssertEqualObjects([self.value sk_decrementShort], [NSNumber numberWithShort:4]);
    XCTAssertEqualObjects([self.value sk_decrementInt], [NSNumber numberWithInt:4]);
    XCTAssertEqualObjects([self.value sk_decrementLong], [NSNumber numberWithLong:4]);
    XCTAssertEqualObjects([self.value sk_decrementLongLong], [NSNumber numberWithLongLong:4]);
    
}

- (void)testAdd {
    XCTAssertEqualObjects([self.value sk_addChar:2], [NSNumber numberWithChar:7]);
    XCTAssertEqualObjects([self.value sk_addShort:2], [NSNumber numberWithShort:7]);
    XCTAssertEqualObjects([self.value sk_addInt:2], [NSNumber numberWithInt:7]);
    XCTAssertEqualObjects([self.value sk_addLong:2], [NSNumber numberWithLong:7]);
    XCTAssertEqualObjects([self.value sk_addLongLong:2l], [NSNumber numberWithLongLong:7]);
}

- (void)testMinus {
    XCTAssertEqualObjects([self.value sk_minusChar:2], [NSNumber numberWithChar:3]);
    XCTAssertEqualObjects([self.value sk_minusShort:2], [NSNumber numberWithShort:3]);
    XCTAssertEqualObjects([self.value sk_minusInt:2], [NSNumber numberWithInt:3]);
    XCTAssertEqualObjects([self.value sk_minusLong:2], [NSNumber numberWithLong:3]);
    XCTAssertEqualObjects([self.value sk_minusLongLong:2], [NSNumber numberWithLongLong:3]);
}

-(void)testTimes {
    __block NSInteger count = 0;
    [@5 sk_times:^{
        count++;
    }];
    
    XCTAssertEqual(count, 5);
}

-(void)testTimesWithIndex {
    __block NSInteger count = 0;
    [@5 sk_timesWithIndex:^(NSUInteger index) {
        XCTAssertEqual(index, count);
        count++;
    }];
    
    XCTAssertEqual(count, 5);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
