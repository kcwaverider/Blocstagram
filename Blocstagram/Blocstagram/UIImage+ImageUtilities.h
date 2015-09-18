//
//  UIImage+ImageUtilities.h
//  Blocstagram
//
//  Created by Chad Clayton on 9/9/15.
//  Copyright (c) 2015 Chad Clayton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageUtilities)

- (UIImage *) imageWithFixedOrientation;
- (UIImage *) imageResizedToMatchAspectRatioOfSize:(CGSize)size;
- (UIImage *) imageCroppedToRect:(CGRect)cropRect;

@end
