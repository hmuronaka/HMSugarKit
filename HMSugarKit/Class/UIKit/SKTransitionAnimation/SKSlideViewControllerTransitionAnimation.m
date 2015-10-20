//
//  SKSlideViewControllerTransitionAnimation.m
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/20.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKSlideViewControllerTransitionAnimation.h"

@implementation SKSlideViewControllerTransitionAnimation

-(instancetype)initWithContainerViewController:(UIViewController*)containerViewController {
    self = [super init];
    if( self ) {
        _containerViewController = containerViewController;
    }
    return self;
}

-(void)cycleFromViewController: (UIViewController*) oldVC toViewController: (UIViewController*) newVC animationDirection:(SKSlideViewControllerAnimationDirection)animationDirection {
    
    // Prepare the two view controllers for the change.
    [oldVC willMoveToParentViewController:nil];
    [self.containerViewController addChildViewController:newVC];
    
    CGRect endFrame;
    
    // Get the start frame of the new view controller and the end frame
    // for the old view controller. Both rectangles are offscreen.
    switch (animationDirection) {
        case SKSlideViewControllerAnimationDirectionLeft: {
            newVC.view.frame = CGRectMake( newVC.view.frame.size.width, 0, newVC.view.frame.size.width, newVC.view.frame.size.height);
            endFrame = CGRectMake( -oldVC.view.frame.size.width, 0, oldVC.view.frame.size.width, oldVC.view.frame.size.height);
            break;
        }
        case SKSlideViewControllerAnimationDirectionRight: {
            newVC.view.frame = CGRectMake( -newVC.view.frame.size.width, 0, newVC.view.frame.size.width, newVC.view.frame.size.height);
            endFrame = CGRectMake( oldVC.view.frame.size.width, 0, oldVC.view.frame.size.width, oldVC.view.frame.size.height);
            break;
        }
        default:
            NSLog(@"animationDirection is illegal. direction=%d", (int)animationDirection);
    }
    
    // Queue up the transition animation.
    [self.containerViewController transitionFromViewController: oldVC toViewController: newVC
                              duration: 0.25 options:0
                            animations:^{
                                // Animate the views to their final positions.
                                newVC.view.frame = oldVC.view.frame;
                                oldVC.view.frame = endFrame;
                            }
                            completion:^(BOOL finished) {
                                // Remove the old view controller and send the final
                                // notification to the new view controller.
                                [oldVC removeFromParentViewController];
                                [newVC didMoveToParentViewController:self.containerViewController];
                            }];
}

@end
