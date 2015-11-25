//
//  UIImage+HMSugarKit.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/10/25.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "UIImage+HMSugarKit.h"

@implementation UIImage (HMSugarKit)

-(UIImage*)sk_resizeScreenSize:(CGSize)screenSize {
    float per = 0;
    if( self.size.height >= self.size.width ) {
        per = screenSize.height / self.size.height;
    } else {
        per = screenSize.width / self.size.width;
    }
    
    UIImage* resizedImage = [self sk_resizeWithWidthRate:per heightRate:per];
    return resizedImage;
}

-(UIImage*)sk_resizeWithWidthRate:(CGFloat)widthRate heightRate:(CGFloat)heightRate {
    UIImage* result;
    
    CGSize resize = CGSizeMake(self.size.width * widthRate, self.size.height * heightRate);
    
    UIGraphicsBeginImageContext(resize);
    [self drawInRect:CGRectMake(0, 0, resize.width, resize.height)];
    result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}

@end
