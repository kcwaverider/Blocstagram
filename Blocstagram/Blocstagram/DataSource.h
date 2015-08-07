//
//  DataSource.h
//  Blocstagram
//
//  Created by Chad Clayton on 8/7/15.
//  Copyright (c) 2015 Chad Clayton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject

+ (instancetype) sharedInstance;
@property (nonatomic, strong, readonly) NSArray *mediaItems;

@end
