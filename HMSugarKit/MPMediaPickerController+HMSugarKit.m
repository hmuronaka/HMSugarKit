//
//  MPMediaPickerController+HMSugarKit.m
//  CutAndLoop
//
//  Created by Muronaka Hiroaki on 2015/10/16.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import "A2DynamicDelegate.h"
#import "NSObject+A2BlockDelegate.h"
#import "NSObject+A2DynamicDelegate.h"
#import "MPMediaPickerController+HMSugarKit.h"

#pragma mark Custom delegate

@interface A2DynamicMPMediaPickerControllerDelegate : A2DynamicDelegate <MPMediaPickerControllerDelegate>

@end

@implementation A2DynamicMPMediaPickerControllerDelegate

-(void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker {
    id realDelegate = self.realDelegate;
    if( realDelegate && [realDelegate respondsToSelector:@selector(mediaPickerDidCancel:)]) {
        [realDelegate mediaPickerDidCancel:mediaPicker];
    }
    
    void (^block)(MPMediaPickerController*)  = [self blockImplementationForMethod:_cmd];
    if( block ) {
        block(mediaPicker);
    }
}

-(void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection {
    id realDelegate = self.realDelegate;
    if( realDelegate && [realDelegate respondsToSelector:@selector(mediaPicker:didPickMediaItems:)] ) {
        [realDelegate mediaPicker:mediaPicker didPickMediaItems:mediaItemCollection];
    }
    
    void (^block)(MPMediaPickerController*, MPMediaItemCollection*) = [self blockImplementationForMethod:_cmd];
    if( block ) {
        block(mediaPicker, mediaItemCollection);
    }
}

@end

#pragma mark Category


@implementation MPMediaPickerController (HMSugarKit)

@dynamic sk_didFinishPickingMediaItemsBlock;
@dynamic sk_didCancelBlock;

+ (void)load {
    @autoreleasepool {
        [self bk_registerDynamicDelegate];
        [self bk_linkDelegateMethods:@{
                                       @"sk_didFinishPickingMediaItemsBlock": @"mediaPicker:didPickMediaItems:",
                                       @"sk_didCancelBlock": @"mediaPickerDidCancel:"
                                       }];
    }
}

@end
