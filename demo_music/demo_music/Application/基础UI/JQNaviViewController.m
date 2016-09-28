//
//  JQNaviViewController.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQNaviViewController.h"


@interface JQNaviViewController ()

@end

@implementation JQNaviViewController
#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置根视图控制器
    self.viewControllers = @[self.mainVC];
    self.navigationBar.translucent = NO;
//    self.navigationBar.barTintColor = [UIColor colorWithRed:0.169 green:0.216 blue:0.353 alpha:1.000];
    self.navigationBar.barTintColor = kRGBA(40,61,99,1);
    self.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - lazy

- (JQMainViewController *)mainVC{
    if (!_mainVC) {
        _mainVC = [JQMainViewController new];
        
    }
    return _mainVC;
}

@end
