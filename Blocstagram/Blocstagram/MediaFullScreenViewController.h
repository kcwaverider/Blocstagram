//
//  MediaFullScreenViewController.h
//  Blocstagram
//
//  Created by Chad Clayton on 8/19/15.
//  Copyright (c) 2015 Chad Clayton. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media;
@class MediaFullScreenViewController;

@protocol MediaFullScreenViewControllerDelegate <NSObject>
@optional
- (void) closeWindow;

@end

@interface MediaFullScreenViewController : UIViewController

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) Media *media;

@property (nonatomic, weak) NSObject <MediaFullScreenViewControllerDelegate> *delegate;

- (instancetype) initWithMedia:(Media *)media;

- (void) centerScrollView;

- (void) recauculateZoomScale;

@end
