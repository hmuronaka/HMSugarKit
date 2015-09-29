//
//  NSDictionary+HMSugarKitTest.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/09/29.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+HMSugarKit.h"

@interface NSDictionary_HMSugarKitTest : XCTestCase

@end

@implementation NSDictionary_HMSugarKitTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMerge {
    
    NSDictionary* a = @{@"A": @1,
                        @"B": @2};
    
    NSDictionary* b = @{@"C": @3,
                        @"D": @4};
    
    NSDictionary* result = [a sk_mergeDictionary:b];
    XCTAssertEqualObjects(result[@"A"], @1);
    XCTAssertEqualObjects(result[@"B"], @2);
    XCTAssertEqualObjects(result[@"C"], @3);
    XCTAssertEqualObjects(result[@"D"], @4);
    
}

- (void)testMergeNil {
    
    NSDictionary* a = @{@"A": @1,
                        @"B": @2};
    
    NSDictionary* b = nil;
    
    NSDictionary* result = [a sk_mergeDictionary:b];
    XCTAssertEqualObjects(result[@"A"], @1);
    XCTAssertEqualObjects(result[@"B"], @2);
}

- (void)testMergeOverride {
    
    NSDictionary* a = @{@"A": @1,
                        @"B": @2};
    
    NSDictionary* b = @{@"B": @3,
                        @"D": @4};
    
    NSDictionary* result = [a sk_mergeDictionary:b];
    XCTAssertEqualObjects(result[@"A"], @1);
    XCTAssertEqualObjects(result[@"B"], @3);
    XCTAssertEqualObjects(result[@"D"], @4);
    
}

- (void)testKeepKeys {
    
    NSDictionary* a = @{@"A": @1,
                        @"B": @2,
                        @"C": @3};
    
    NSDictionary* result = [a sk_keepFromKeys:@[@"A", @"C"]];
    XCTAssertEqualObjects(result[@"A"], @1);
    XCTAssertNil(result[@"B"]);
    XCTAssertEqualObjects(result[@"C"], @3);
}

- (void)testKeepKeysNil {
    
    NSDictionary* a = @{@"A": @1,
                        @"B": @2,
                        @"C": @3};
    
    NSDictionary* result = [a sk_keepFromKeys:nil];
    XCTAssertEqualObjects(result[@"A"], @1);
    XCTAssertEqualObjects(result[@"B"], @2);
    XCTAssertEqualObjects(result[@"C"], @3);
}


- (void)testKeepIf {
    
    NSDictionary* a = @{@"A": @1,
                        @"B": @2,
                        @"C": @3};
    
    NSDictionary* result = [a sk_keepIf:^BOOL(id  _Nonnull key, id  _Nonnull value) {
        return [key isEqualToString:@"B"];
    }];
    XCTAssertNil(result[@"A"]);
    XCTAssertEqualObjects(result[@"B"], @2);
    XCTAssertNil(result[@"C"]);
}

- (void)testKeepIfNil {
    
    NSDictionary* a = @{@"A": @1,
                        @"B": @2,
                        @"C": @3};
    
    NSDictionary* result = [a sk_keepIf:nil];
    XCTAssertEqualObjects(result[@"A"], @1);
    XCTAssertEqualObjects(result[@"B"], @2);
    XCTAssertEqualObjects(result[@"C"], @3);
}

- (void)testRemoveKeys {
    
    NSDictionary* a = @{@"A": @1,
                        @"B": @2,
                        @"C": @3};
    
    NSDictionary* result = [a sk_removeFromKeys:@[@"A", @"C"]];
    XCTAssertNil(result[@"A"]);
    XCTAssertEqualObjects(result[@"B"], @2);
    XCTAssertNil(result[@"C"]);
}

- (void)testRemoveKeysNil {
    
    NSDictionary* a = @{@"A": @1,
                        @"B": @2,
                        @"C": @3};
    
    NSDictionary* result = [a sk_removeFromKeys:nil];
    XCTAssertEqualObjects(result[@"A"], @1);
    XCTAssertEqualObjects(result[@"B"], @2);
    XCTAssertEqualObjects(result[@"C"], @3);
}

- (void)testRemoveIf {
    
    NSDictionary* a = @{@"A": @1,
                        @"B": @2,
                        @"C": @3};
    
    NSDictionary* result = [a sk_removeIf:^BOOL(id  _Nonnull key, id  _Nonnull value) {
        return [value isEqualToNumber:@2];
    }];
    XCTAssertEqualObjects(result[@"A"], @1);
    XCTAssertNil(result[@"B"]);
    XCTAssertEqualObjects(result[@"C"], @3);
}

@end
