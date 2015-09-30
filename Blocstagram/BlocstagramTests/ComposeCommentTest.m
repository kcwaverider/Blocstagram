//
//  ComposeCommentTest.m
//  Blocstagram
//
//  Created by Chad Clayton on 9/29/15.
//  Copyright © 2015 Chad Clayton. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ComposeCommentView.h"

@interface ComposeCommentTest : XCTestCase

@end

@implementation ComposeCommentTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNotCommenting {
    ComposeCommentView *comment = [[ComposeCommentView alloc] init];
    [comment setText:nil];
    XCTAssertEqual(comment.isWritingComment, NO, @"Both should be NO");
}

- (void) testCommenting {
    ComposeCommentView *comment = [[ComposeCommentView alloc] init];
    [comment setText:@"abc"];
    XCTAssertEqual(comment.isWritingComment, YES, @"Both should be YES");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
