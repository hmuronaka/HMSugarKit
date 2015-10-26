//
//  MPMediaPickerController+HMSugarKit.h
//  CutAndLoop
//
//  Created by Muronaka Hiroaki on 2015/10/16.
//  Copyright © 2015年 Muronaka Hiroaki. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>

@interface MPMediaPickerController (HMSugarKit)

@property(nonatomic, copy) void (^sk_didFinishPickingMediaItemsBlock)(MPMediaPickerController* mediaPicker, MPMediaItemCollection* collection);
@property(nonatomic, copy) void (^sk_didCancelBlock)(MPMediaPickerController* mediaPicker);

@end
