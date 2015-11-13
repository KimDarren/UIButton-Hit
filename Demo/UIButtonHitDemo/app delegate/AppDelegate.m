//
//  AppDelegate.m
//  UIButtonHitDemo
//
//  Created by KimTae jun on 2015. 11. 13..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import "AppDelegate.h"

// View controller
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] init];
    _window.rootViewController = [[ViewController alloc] init];
    [_window makeKeyAndVisible];
    
    return YES;
}

@end
