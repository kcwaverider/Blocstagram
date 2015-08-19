//
//  User.h
//  Blocstagram
//
//  Created by Chad Clayton on 8/7/15.
//  Copyright (c) 2015 Chad Clayton. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface User : NSObject <NSCoding>

@property (nonatomic, strong) NSString *idNumber;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSURL *profilePictureURL;
@property (nonatomic, strong) UIImage *profilePicture;

- (instancetype) initWithDictionary:(NSDictionary *) userDictionary;


@end
