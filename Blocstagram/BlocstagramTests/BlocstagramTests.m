//
//  BlocstagramTests.m
//  BlocstagramTests
//
//  Created by Chad Clayton on 8/6/15.
//  Copyright (c) 2015 Chad Clayton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "User.h"

@interface BlocstagramTests : XCTestCase

@end

@implementation BlocstagramTests

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
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void) testCreateUserObject {
    
    NSDictionary *testDictionary = @{@"id":@"12345678",
                                    @"username":@"flintstone",
                                    @"fullname" : @"Fred Flintstone",
                                    @"profileString":@"http://google.com/fred"
                                    };
    
    User *user = [[User alloc] initWithDictionary:testDictionary];
    
    XCTAssertEqualObjects(user.idNumber, testDictionary[@"id"],@"nope they're not the same");
    
}
@end
