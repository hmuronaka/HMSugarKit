//
//  SKRangeTest.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/02.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SKRange.h"
#import "NSDate+HMSugarKit.h"

@interface SKRangeTest : XCTestCase

@end

@implementation SKRangeTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark include

-(void)testIncludeNumberRange {
    
    SKRange* r = [[SKRange alloc] initWithBegin:@1 end:@10];
    XCTAssertTrue([r sk_include:@5]);
    XCTAssertTrue([r sk_include:@1]);
    XCTAssertTrue([r sk_include:@10]);
    XCTAssertFalse([r sk_include:@11]);
    XCTAssertFalse([r sk_include:@(0)]);
    
}

-(void)testIncludeDateRange {
    
    NSDate* now = [NSDate new];
    NSDate* begin = [now sk_dateByAddingDays:-5];
    NSDate* end = [now sk_dateByAddingDays:5];
    
    SKRange* r = [[SKRange alloc] initWithBegin:begin end:end];
    XCTAssertTrue([r sk_include:begin]);
    XCTAssertTrue([r sk_include:end]);
    XCTAssertTrue([r sk_include:[now sk_dateByAddingDays:1]]);
    XCTAssertFalse([r sk_include:[now sk_dateByAddingDays:6]]);
    XCTAssertFalse([r sk_include:[now sk_dateByAddingDays:-6]]);
    
}

-(void)testClassMethodInclude {
    
    XCTAssertTrue([SKRange sk_includeWithBegin:@1 end:@10 value:@5]);
    XCTAssertTrue([SKRange sk_includeWithBegin:@1 end:@10 value:@1]);
    XCTAssertTrue([SKRange sk_includeWithBegin:@1 end:@10 value:@10]);
    XCTAssertFalse([SKRange sk_includeWithBegin:@1 end:@10 value:@0]);
    XCTAssertFalse([SKRange sk_includeWithBegin:@1 end:@10 value:@11]);
    
}

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark exclude

-(void)testExcludeNumberRange {
    
    SKRange* r = [[SKRange alloc] initWithBegin:@1 end:@10];
    XCTAssertFalse([r sk_exclude:@5]);
    XCTAssertFalse([r sk_exclude:@1]);
    XCTAssertFalse([r sk_exclude:@10]);
    XCTAssertTrue([r sk_exclude:@11]);
    XCTAssertTrue([r sk_exclude:@(0)]);
    
}

-(void)testExcludeDateRange {
    
    NSDate* now = [NSDate new];
    NSDate* begin = [now sk_dateByAddingDays:-5];
    NSDate* end = [now sk_dateByAddingDays:5];
    
    SKRange* r = [[SKRange alloc] initWithBegin:begin end:end];
    XCTAssertFalse([r sk_exclude:begin]);
    XCTAssertFalse([r sk_exclude:end]);
    XCTAssertFalse([r sk_exclude:[now sk_dateByAddingDays:1]]);
    XCTAssertTrue([r sk_exclude:[now sk_dateByAddingDays:6]]);
    XCTAssertTrue([r sk_exclude:[now sk_dateByAddingDays:-6]]);
    
}

-(void)testClassMethodExclude {
    
    XCTAssertFalse([SKRange sk_excludeWithBegin:@1 end:@10 value:@5]);
    XCTAssertFalse([SKRange sk_excludeWithBegin:@1 end:@10 value:@1]);
    XCTAssertFalse([SKRange sk_excludeWithBegin:@1 end:@10 value:@10]);
    XCTAssertTrue([SKRange sk_excludeWithBegin:@1 end:@10 value:@0]);
    XCTAssertTrue([SKRange sk_excludeWithBegin:@1 end:@10 value:@11]);
    
}



@end
