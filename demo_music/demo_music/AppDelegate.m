//
//  AppDelegate.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Custom.h"
#import "JQNaviViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self configGlobalSystem];
    self.window.rootViewController = [JQNaviViewController new];
    return YES;
}
- (UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
        _window.backgroundColor = [UIColor whiteColor];
    }
    return _window;
}
@end
