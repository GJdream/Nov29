//
//  Nov29AppDelegate.m
//  Nov29
//
//  Created by Lisa Jenkins on 11/27/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import "Nov29AppDelegate.h"
#import "View.h"
#import "SpyView.h"

@implementation Nov29AppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSString *themeFilename = [bundle pathForResource:@"jbtheme1" ofType:@"mp3"];
    NSLog(@"filename == \"%@\"", themeFilename);
    
    NSURL *themeUrl = [NSURL fileURLWithPath:themeFilename isDirectory:NO];
    NSLog(@"url == \"%@\"", themeUrl);
    
    OSStatus themeError = AudioServicesCreateSystemSoundID((__bridge CFURLRef)themeUrl, &sid);
    if (themeError != kAudioServicesNoError) {
        NSLog(@"AudioSerivcesCreateSystemSoundID error == %ld", themeError);
    }
    
    NSString *filmFilename = [bundle pathForResource:@"legospy" ofType:@"MOV"];
    
    NSURL *filmUrl = [NSURL fileURLWithPath:filmFilename];
    if (filmUrl == nil) {
        NSLog(@"could not create URL for file %@", filmFilename);
    }
    controller = [[MPMoviePlayerController alloc] init];
    
    if (controller == nil) {
        NSLog(@"could not createMPMoviePlayerController");
        return YES;
    }
    controller.shouldAutoplay = NO;
    controller.scalingMode = MPMovieScalingModeNone;
    controller.controlStyle = MPMovieControlStyleDefault;
    controller.movieSourceType = MPMovieSourceTypeFile;
    [controller setContentURL:filmUrl];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center
     addObserver:self
     selector:@selector(playbackDidFinish:)
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:controller];
    
    UIScreen *screen = [UIScreen mainScreen];
    view = [[View alloc] initWithFrame:screen.applicationFrame];
    spyView = [[SpyView alloc] initWithFrame:screen.applicationFrame];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    [self.window addSubview:view];
    return YES;
}


-(void) touchUpInside:(id)sender{
    if ([sender titleForState:UIControlStateNormal] == @"Play your theme song") {
        AudioServicesPlaySystemSound(sid);
    }
    if ([sender titleForState:UIControlStateNormal] == @"See how it's done") {
        controller.view.frame = view.frame;
        [view removeFromSuperview];
        [self.window addSubview:controller.view];
        [controller play];
    }
    
    if ([sender titleForState:UIControlStateNormal] == @"Review your mission") {
        [UIView
         transitionFromView:view
         toView:spyView
         duration:2.25
         options: UIViewAnimationOptionTransitionCurlUp
         completion:NULL];
    }
    
    if ([sender titleForState:UIControlStateNormal] == @"Destroy message") {
        [UIView
         transitionFromView:spyView toView:view duration:2.25 options:UIViewAnimationOptionTransitionCrossDissolve completion:NULL];
    }
    
}

-(void) playbackDidFinish: (NSNotification *) notification {
    [controller.view removeFromSuperview];
    [UIApplication sharedApplication].statusBarHidden = NO;
    [self.window addSubview: view];
}

-(void) valueChanged: (id) sender {
    UISwitch *s = sender;
    if (s.isOn) {
        [view nightVisionOn];
    } else {
        [view nightVisionOff];
    }
}

-(void) dealloc {
    OSStatus error = AudioServicesDisposeSystemSoundID(sid);
    if (error != kAudioServicesNoError) {
        NSLog(@"AudioServicesDisposeSystemSoundID error == %1ld", error);
    }
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
