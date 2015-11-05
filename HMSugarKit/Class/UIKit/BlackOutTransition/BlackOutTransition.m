//
//  BlackOutTransition.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/11/05.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "BlackOutTransition.h"

@implementation BlackOutTransition

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {

    return self;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView* containerView = [transitionContext containerView];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // Autolayoutを適用させるためにめっちゃ必要。
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    toViewController.view.frame = screenBounds;
    
    [containerView addSubview:toViewController.view];
    
    toViewController.view.alpha = 0;
    // 上の3つを使ってanimation処理を書く
    // scaleとかframeとかrotateとか。。。
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        fromViewController.view.alpha = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionCurlUp animations:^{
            toViewController.view.alpha = 1;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }];
}


@end
