//
//  AppDelegate.m
//  QQSideSlip
//
//  Created by Vetech on 15/11/10.
//  Copyright © 2015年 BFL. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[MainViewController alloc] init];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
