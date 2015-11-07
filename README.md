HMSugarKit
=======

This project contains many categories and some classes.

# Core

|Class|Method|
|:----|:----|
|NSURL|sk_URLWithTelNumber:|
|NSDate|Extends [NSDate-Extensions](https://github.com/erica/NSDate-Extensions/blob/master/NSDate%2BUtilities.h)
|NSSet|sk_addObject:|
|NSOrderedSet|sk_orderedSetExchangeFromIndex:toIndex:|
|NSNumber|increment/decrement/times/compare|
|SKRange||

# UIKit

|Class|Method|
|:----|:----|
|UIView|sk_traverseWithBlock:<br>sk_traverseWithBlock<br>sk_addGradientWithBlock:<br>sk_addShadowWithOpacity:<br>sk_setBackgroundPatternImagewithImageName:|
|UIImage|sk_resizeWithWidthRate:|
|UIWebView|sk_loadRequestWithURLString|
|UITableView|sk_indexPathFromTouchEvent:|
|UIKitFunction|Methods for CGSize CGPoint CGRect|
|BlackOutTransition|UIViewController animation transition|


# MediaPlayer

|Class|Method|
|:----|:----|
|MPMediaPickerController|Blocks|

# SKRange

```obj-c

-(void)testIncludeNumberRange {
    SKRange* r = [[SKRange alloc] initWithBegin:@1 end:@10];
    XCTAssertTrue([r sk_include:@5]);
    XCTAssertTrue([r sk_include:@1]);
    XCTAssertTrue([r sk_include:@10]);
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
}

-(void)testClassMethodInclude {
    XCTAssertTrue([SKRange sk_includeWithBegin:@1 end:@10 value:@5]);
    XCTAssertTrue([SKRange sk_includeWithBegin:@1 end:@10 value:@1]);
    XCTAssertTrue([SKRange sk_includeWithBegin:@1 end:@10 value:@10]);
    XCTAssertFalse([SKRange sk_includeWithBegin:@1 end:@10 value:@0]);
}

-(void)testExcludeNumberRange {
    SKRange* r = [[SKRange alloc] initWithBegin:@1 end:@10];
    XCTAssertFalse([r sk_exclude:@5]);
    XCTAssertFalse([r sk_exclude:@10]);
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
}

-(void)testClassMethodExclude {
    XCTAssertFalse([SKRange sk_excludeWithBegin:@1 end:@10 value:@5]);
    XCTAssertFalse([SKRange sk_excludeWithBegin:@1 end:@10 value:@1]);
    XCTAssertFalse([SKRange sk_excludeWithBegin:@1 end:@10 value:@10]);
    XCTAssertTrue([SKRange sk_excludeWithBegin:@1 end:@10 value:@0]);
}

```

