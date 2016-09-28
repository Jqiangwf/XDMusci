//
//  JQMainViewController.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQMainViewController.h"

@interface JQMainViewController ()

@end

@implementation JQMainViewController
#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    [self pageVC];
    self.title = @"乐库";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - lazy
- (JQPageViewController *)pageVC{
    if (!_pageVC) {
        _pageVC = [JQPageViewController new];
        //把一个控制器的视图 加到另一个控制器上，必须让这个控制器成为子控制器
        //87 165 252
        //颜色的设置要在显示之前
        _pageVC.titleColorSelected = kRGBA(87, 165, 252, 1);
        _pageVC.menuViewStyle = 1;
        _pageVC.progressWidth = 35;
        _pageVC.titleSizeSelected = 16;
        _pageVC.titleSizeNormal = 16;
        _pageVC.menuHeight = 36;
        
        [self addChildViewController:_pageVC];
        [self.view addSubview:_pageVC.view];
        [_pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
    }
    return _pageVC;
}


@end
