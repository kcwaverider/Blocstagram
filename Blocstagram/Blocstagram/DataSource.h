//
//  DataSource.h
//  Blocstagram
//
//  Created by Chad Clayton on 8/7/15.
//  Copyright (c) 2015 Chad Clayton. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Media;

typedef void (^NewItemCompletionBlock)(NSError *error);

@interface DataSource : NSObject

+ (instancetype) sharedInstance;
@property (nonatomic, strong, readonly) NSArray *mediaItems;
@property (nonatomic, strong, readonly) NSString *accessToken;

- (void) deleteMediaItem:(Media *)item;

- (void) requestNewItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler;
- (void) requestOldItemsWithCompletionHandler:(NewItemCompletionBlock)completionhandler;
+ (NSString *) instagramClientID;

@end
