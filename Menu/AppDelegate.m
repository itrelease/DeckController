//
//  AppDelegate.m
//  Menu
//
//  Created by Anton Byrna on 2/4/13.
//  Copyright (c) 2013 Anton Byrna. All rights reserved.
//

#import "AppDelegate.h"

#import "MenuViewController.h"
#import "ContentViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    MenuViewController *menuViewController = [[MenuViewController alloc] initWithNibName:nil bundle:nil];
    ContentViewController *contentViewController = [[ContentViewController alloc] initWithNibName:nil bundle:nil];
    self.deckViewController = [[DeckViewController alloc] initWithMenuViewController:menuViewController activeViewController:[[UINavigationController alloc] initWithRootViewController:contentViewController]];
    self.window.rootViewController = self.deckViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
