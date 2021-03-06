//
//  AppDelegate.m
//  NoteBook
//
//  Created by Sylar on 3/11/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//

#import "AppDelegate.h"
#import "NoteListViewController.h"
//#import "AVOHelper.h"
#import "ReminderHelper.h"
#import "SettingHelper.h"
//////////////////////////////////////////////////////////////////
@interface AppDelegate()
{
    UINavigationController   *m_navi;
}
@end
//////////////////////////////////////////////////////////////////
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    [AVOSCloud setApplicationId:kAVOAppId clientKey:kAVOAppKey];
//    [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    NoteListViewController* dd = [[NoteListViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:dd];
    m_navi = nav;
    self.window.rootViewController = nav;
    [_window addSubview:[nav view]];
    [self.window makeKeyAndVisible];
    
//    [[AVOHelper Share] RegisterIfNot];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    DefaultViewController *top_viewcontroller = (DefaultViewController *)m_navi.topViewController;
    if ([top_viewcontroller isKindOfClass:[NoteListViewController class]])
    {
        [(NoteListViewController *)top_viewcontroller EndEdit];
    }
    [[SettingHelper Share] SynchronizePasswordTime];
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
//    NSLog(@"enter background");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    DefaultViewController *top_view_controller = (DefaultViewController *)m_navi.topViewController;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
//    NSLog(@"enter foreground");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
//    [[AVOHelper Share] UploadBecomeActivesIfNeed];
    if ([[SettingHelper Share] checkNeedPresentPasswordView])
    {
        DefaultViewController *top_view_controller = (DefaultViewController *)m_navi.topViewController;
        [top_view_controller ShowPasswordView];
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
