//
//  OutsideTapRecognizer.h
//  Blocstagram
//
//  Created by Chad Clayton on 9/28/15.
//  Copyright © 2015 Chad Clayton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface OutsideTapRecognizer : UITapGestureRecognizer

- (instancetype) initWithTarget:(id)target action:(SEL)action window:(UIWindow *) window;




@end
