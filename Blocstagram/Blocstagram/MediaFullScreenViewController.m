//
//  MediaFullScreenViewController.m
//  Blocstagram
//
//  Created by Chad Clayton on 8/19/15.
//  Copyright (c) 2015 Chad Clayton. All rights reserved.
//

#import "MediaFullScreenViewController.h"
#import "Media.h"
#import "OutsideTapRecognizer.h"

@interface MediaFullScreenViewController () <UIScrollViewDelegate>


@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, strong) UITapGestureRecognizer *doubleTap;
@property (nonatomic, strong) OutsideTapRecognizer *closeTap;
@property (nonatomic, strong) UIWindow *window;

@end

@implementation MediaFullScreenViewController

- (instancetype) initWithMedia:(Media *)media {
    self = [super init];
    
    if (self) {
        self.media = media;
    }
    
    return self;
}
    

- (void)viewDidLoad {
    [super viewDidLoad];
    self.window = [UIApplication sharedApplication].delegate.window;
    // #1
    self.scrollView = [UIScrollView new];
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.scrollView];
    
    // #2
    self.imageView = [UIImageView new];
    self.imageView.image = self.media.image;
    
    [self.scrollView addSubview:self.imageView];
    
    // #3
    self.scrollView.contentSize = self.media.image.size;
    
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self.window action:@selector(tapFired:)];
    
    self.doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapFired:)];
    self.doubleTap.numberOfTapsRequired = 2;
    
    
    
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFired:)];
    [self.window addGestureRecognizer:self.tap];
    
    self.closeTap = [[OutsideTapRecognizer alloc] initWithTarget:self action:@selector(tapFired:)];
    [self.closeTap setCancelsTouchesInView:NO];
    [self.window addGestureRecognizer:self.closeTap];
    
    
    [self.window addGestureRecognizer:self.tap];
    [self.scrollView addGestureRecognizer:self.doubleTap];
    [self addShareButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tapFired:) name:@"theDismissTap" object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    // #4
    self.scrollView.frame = self.view.bounds;
    
    [self recauculateZoomScale];
}

- (void) recauculateZoomScale {

    // #5
    CGSize scrollViewFramSize = self.scrollView.frame.size;
    CGSize scrollViewContentSize = self.scrollView.contentSize;
    
    scrollViewContentSize.height /= self.scrollView.zoomScale;
    scrollViewContentSize.width /= self.scrollView.zoomScale;
    
    CGFloat scaleWidth = scrollViewFramSize.width / scrollViewContentSize.width;
    CGFloat scaleHeight = scrollViewFramSize.height / scrollViewContentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    
    self.scrollView.minimumZoomScale = minScale;
    self.scrollView.maximumZoomScale = 1;
}

- (void) centerScrollView {
    [self.imageView sizeToFit];
    
    CGSize boundsSize = self.scrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - CGRectGetWidth(contentsFrame)) / 2;
    } else {
        contentsFrame.origin.x = 0;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - CGRectGetHeight(contentsFrame)) / 2;
    } else {
        contentsFrame.origin.y = 0;
    }
    
    self.imageView.frame = contentsFrame;
}

#pragma mark - UIScrollViewDelegate
  // #6
- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

  // #7
- (void) scrollViewDidZoom:(UIScrollView *)scrollView {
    [self centerScrollView];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self centerScrollView];
}

#pragma mark - Gesture Recognizers

- (void) tapFired:(UITapGestureRecognizer *) sender {
    
   // [self.window removeGestureRecognizer:self.closeTap];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) doubleTapFired:(UITapGestureRecognizer *) sender {
    if (self.scrollView.zoomScale == self.scrollView.minimumZoomScale) {
        // #8
        CGPoint locationPoint = [sender locationInView:self.imageView];
        
        CGSize scrollViewSize = self.scrollView.bounds.size;
        
        CGFloat width = scrollViewSize.width / self.scrollView.maximumZoomScale;
        CGFloat height = scrollViewSize.height / self.scrollView.maximumZoomScale;
        CGFloat x = locationPoint.x - (width / 2);
        CGFloat y = locationPoint.y - (height / 2);
        
        [self.scrollView zoomToRect:CGRectMake(x, y, width, height) animated:YES];
    } else {
        // #9
        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale animated:YES];
    }
}

- (void) shareImage {
    NSArray *shareArray = @[self.media.caption, self.media.image];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:shareArray applicationActivities:nil];
    [self presentViewController:activityVC animated:YES completion:nil];
}

- (void) addShareButton {
    CGFloat width = 80;
    CGFloat height = 70;
    CGRect buttonBounds = CGRectMake(self.view.bounds.size.width - width,0, width, height);
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    shareButton.frame = buttonBounds;
    
    //shareButton.transform = CGAffineTransformMakeRotation(M_PI_2);

    [shareButton setTitle: @"Share" forState:normal];
    [shareButton addTarget:self action:@selector(shareImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareButton];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


















