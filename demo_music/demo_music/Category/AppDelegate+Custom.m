//
//  AppDelegate+Custom.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "AppDelegate+Custom.h"
#import <AFNetworkActivityIndicatorManager.h>
@implementation AppDelegate (Custom)
//为了AppDelegate的整洁，把不常用的代码分到另一个类中
- (void)configGlobalSystem{
    //图片的统一配置
    [UIImageView appearance].contentMode = UIViewContentModeScaleAspectFill;
    [UIImageView appearance].clipsToBounds = YES;
    //AF有网络操作的 状态栏提示
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
