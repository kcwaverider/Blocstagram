//
//  MediaTests.m
//  Blocstagram
//
//  Created by Chad Clayton on 9/29/15.
//  Copyright © 2015 Chad Clayton. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Media.h"
#import "User.h"

@interface MediaTests : XCTestCase

@property (nonatomic, strong) User *user;

@end

@implementation MediaTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatMediaInitializationWorks {
    NSDictionary *testDictionary = @{@"id" : @"12345",
                                     @"user" : @{@"id": @"8675309",
                                                  @"username" : @"d'oh",
                                                  @"full_name" : @"Homer Simpson",
                                                  @"profile_picture" : @"http://www.example.com/example.jpg"},
                                      @"images" : @{
                                              @"standard_resolution" : @{
                                                      @"url" : @"http://www.example.com/example.jpg"
                                                      }
                                              },
                                      @"caption" : @{
                                              @"text" : @"Caption Text"
                                              }
                                      };
    Media *testMedia = [[Media alloc] initWithDictionary:testDictionary];
    User *user = [[User alloc] initWithDictionary:testDictionary[@"user"]];
    //NSLog(@"%@ %@", testMedia.user.idNumber, testUser.idNumber);
    XCTAssertEqualObjects(testMedia.idNumber, testDictionary[@"id"], @"The id number should be equal");
//    XCTAssertEqualObjects(testMedia.user, [[User alloc] initWithDictionary: testDictionary[@"user"]], @"The Users should be the same");
    XCTAssertEqualObjects(testMedia.user, user, @"The Users should be the same");
    XCTAssertEqualObjects(testMedia.mediaURL, [NSURL URLWithString:testDictionary[@"images"][@"standard_resolution"][@"url"]], @"Media URLs should match");
    XCTAssertEqualObjects(testMedia.caption, testDictionary[@"caption"][@"text"]);
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
