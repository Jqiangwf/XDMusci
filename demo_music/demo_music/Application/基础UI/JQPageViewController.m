//
//  JQPageViewController.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQPageViewController.h"
#import "JQRankingListTableViewController.h"
#import "JQSongListCollectionViewController.h"
#import "JQSingerTableViewController.h"
#import "JQSingTableViewController.h"
#import "JQRadioViewController.h"
#import "JQRecommendCollectionViewController.h"

@interface JQPageViewController ()

@end

@implementation JQPageViewController

#pragma mark - life

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - delegate
-(NSArray<NSString *> *)titles{
    return @[@"推荐",@"歌单",@"榜单",@"歌手",@"电台",@"K歌"];
}
-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    if (index == 0) {
        JQRecommendCollectionViewController *vc = [[JQRecommendCollectionViewController alloc]initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
        vc.collectionView.backgroundColor = [UIColor whiteColor];
        return vc;
    }
    if (index == 1) {
        JQSongListCollectionViewController *vc = [[JQSongListCollectionViewController alloc]init];
        return vc;
    }
    if (index == 2) {
        JQRankingListTableViewController *vc  = [[JQRankingListTableViewController alloc]init];
        return vc;
    }
    if (index == 3) {
        JQSingerTableViewController *vc = [[JQSingerTableViewController alloc]init];
        return vc;
    }
    if (index == 4) {
        JQRadioViewController *vc = [[JQRadioViewController alloc]init];
        return vc;
    }
    if (index == 5) {
        JQSingTableViewController *vc = [[JQSingTableViewController alloc]init];
        return vc;
    }
    return [UIViewController new];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
