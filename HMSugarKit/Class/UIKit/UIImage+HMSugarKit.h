//
//  UIImage+HMSugarKit.h
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/10/25.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HMSugarKit)

-(UIImage*)sk_resizeScreenSize:(CGSize)screenSize;
-(UIImage*)sk_resizeWithWidthRate:(CGFloat)widthRate heightRate:(CGFloat)heightRate;

@end
