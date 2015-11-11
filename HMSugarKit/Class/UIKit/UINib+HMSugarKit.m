//
//  UINib+HMSugarKit.m
//  LoadXIBDynamically
//
//  Created by Muronaka Hiroaki on 2015/11/11.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UINib+HMSugarKit.h"
#import "UIDevice+HMSugarKit.h"

@implementation UINib (HMSugarKit)

+(instancetype)sk_loadWithNibName:(NSString*)nibName bundle:(NSBundle *)bundleOrNil path:(NSString *)path {
    
    UINib* result = [self sk_loadDynamicallyWithNibName:nibName bundle:bundleOrNil path:path];
    if( !result ) {
        result = [UINib nibWithNibName:nibName bundle:bundleOrNil];
    }
    
    return result;
}

+(instancetype)sk_loadDynamicallyWithNibName:(NSString*)nibName bundle:(NSBundle *)bundleOrNil path:(NSString *)path {
    
    if(!path) {
        return nil;
    }
    
    NSString* nibFilePath = [self sk_nibFilePath:nibName path:path];
    NSData* xibData = [NSData dataWithContentsOfFile:nibFilePath];
    
    if( !xibData ) {
        return nil;
    }
    
    UINib* dynamicNIB = [UINib nibWithData:xibData bundle:bundleOrNil];
    return dynamicNIB;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark private

+(NSString*)sk_nibFilePath:(NSString*)nibName path:(NSString*)path {
    if(path == nil ) {
        return nil;
    }
    
    NSString* tempNibName;
    if( [UIDevice currentDevice].sk_isIPad ) {
        tempNibName = [NSString stringWithFormat:@"%@~ipad.xib.lxd", nibName];
    } else {
        tempNibName = [NSString stringWithFormat:@"%@~iphone.xib.lxd", nibName];
    }
    
    NSString* nibFilePath = [path stringByAppendingPathComponent:tempNibName];
    if( [[NSFileManager defaultManager] fileExistsAtPath:nibFilePath] ) {
        return nibFilePath;
    }
    
    tempNibName = [NSString stringWithFormat:@"%@.xib.lxd", nibName];
    nibFilePath = [path stringByAppendingPathComponent:tempNibName];
    return nibFilePath;
}

@end
