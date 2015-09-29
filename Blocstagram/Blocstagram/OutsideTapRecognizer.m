//
//  OutsideTapRecognizer.m
//  Blocstagram
//
//  Created by Chad Clayton on 9/28/15.
//  Copyright © 2015 Chad Clayton. All rights reserved.
//

#import "OutsideTapRecognizer.h"



@implementation OutsideTapRecognizer

- (instancetype) initWithTarget:(id)target action:(SEL)action window:(UIWindow *) window {
    self = [super initWithTarget:target action:action];
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    [super touchesBegan:touches withEvent:event];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    [super touchesMoved:touches withEvent:event];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"theDismissTap" object:nil];
    
    
    [super touchesCancelled:touches withEvent:event];
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    [super touchesCancelled:touches withEvent:event];
}

- (void) ignoreTouch:(UITouch *)touch forEvent:(UIEvent *)event {
    
}

@end
