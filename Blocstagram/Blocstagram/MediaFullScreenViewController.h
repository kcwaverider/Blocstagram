//
//  MediaFullScreenViewController.h
//  Blocstagram
//
//  Created by Chad Clayton on 8/19/15.
//  Copyright (c) 2015 Chad Clayton. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media;

@interface MediaFullScreenViewController : UIViewController

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) Media *media;



- (instancetype) initWithMedia:(Media *)media;

- (void) centerScrollView;

- (void) recauculateZoomScale;

@end
