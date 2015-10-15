//
//  PiaShareLog.h
//  PiaShare
//
//  Created by MuronakaHiroaki on 2015/10/15.
//  Copyright © 2015年 plusadd. All rights reserved.
//

#define NSLog(format, ...) NSLog(@"%20s%5d: " format, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#define NSLogObj(var) NSLog(@"%20s%5d: " @#var @"=%@" , __PRETTY_FUNCTION__, __LINE__, var)
