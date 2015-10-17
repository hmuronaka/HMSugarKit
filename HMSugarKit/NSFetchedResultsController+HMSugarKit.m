//
//  NSFetchedResultsController+HMSugarKit.m
//  CutAndLoop
//
//  Created by Muronaka Hiroaki on 2015/10/16.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "NSFetchedResultsController+HMSugarKit.h"

@implementation NSFetchedResultsController (HMSugarKit)

-(id)objectForKeyedSubscript:(NSIndexPath*)indexPath {
    return [self objectAtIndexPath:indexPath];
}

@end
