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

- (void) deleteMediaItem:(Media *)item;

@end
