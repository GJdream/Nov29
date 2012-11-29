//
//  Nov29AppDelegate.h
//  Nov29
//
//  Created by Lisa Jenkins on 11/27/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <MediaPlayer/MediaPlayer.h>
@class View;
@class SpyView;

@interface Nov29AppDelegate : UIResponder <UIApplicationDelegate>{
    NSUInteger index;
    SystemSoundID sid;
    MPMoviePlayerController *controller;
    UIWindow *_window;
    View *view;
    SpyView *spyView;
}

-(void) touchUpInside: (id) sender;
-(void) valueChanged: (id) sender;

@property (strong, nonatomic) UIWindow *window;

@end
