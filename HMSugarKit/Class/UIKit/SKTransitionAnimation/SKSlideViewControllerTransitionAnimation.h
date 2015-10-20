//
//  SKSlideViewControllerTransitionAnimation.h
//  HMSugarKit
//
//  Created by MuronakaHiroaki on 2015/10/20.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SKSlideViewControllerAnimationDirection) {
    SKSlideViewControllerAnimationDirectionNone,
    SKSlideViewControllerAnimationDirectionLeft,
    SKSlideViewControllerAnimationDirectionRight,
};

@interface SKSlideViewControllerTransitionAnimation : NSObject

@property(nonatomic, readonly) UIViewController* containerViewController;

-(instancetype)initWithContainerViewController:(UIViewController*)containerViewController;

-(void)cycleFromViewController: (UIViewController*) oldVC toViewController: (UIViewController*) newVC animationDirection:(SKSlideViewControllerAnimationDirection)animationDirection;

@end
