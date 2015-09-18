//
//  ImageLibraryViewController.h
//  Blocstagram
//
//  Created by Chad Clayton on 9/17/15.
//  Copyright (c) 2015 Chad Clayton. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageLibraryViewController;

@protocol ImageLibraryViewControllerDelegate <NSObject>

- (void) imageLibraryViewController:(ImageLibraryViewController *)imageLibraryViewController didCompleteWithIMage:(UIImage *) image;

@end

@interface ImageLibraryViewController : UICollectionViewController

@property (nonatomic, weak) NSObject <ImageLibraryViewControllerDelegate> *delegate;

@end
