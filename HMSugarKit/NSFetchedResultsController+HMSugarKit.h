//
//  NSFetchedResultsController+HMSugarKit.h
//  CutAndLoop
//
//  Created by Muronaka Hiroaki on 2015/10/16.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSFetchedResultsController (HMSugarKit)

-(id)objectForKeyedSubscript:(NSIndexPath*)indexPath;

@end
