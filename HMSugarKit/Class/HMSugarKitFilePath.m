//
//  HMSugarKitFilePath.m
//  HMSugarKit
//
//  Created by Muronaka Hiroaki on 2015/10/17.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMSugarKitFilePath.h"

NSURL* sk_documentDirectory() {
    return [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].lastObject;
}