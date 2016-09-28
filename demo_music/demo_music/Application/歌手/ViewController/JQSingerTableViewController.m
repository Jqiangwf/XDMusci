//
//  JQSingerTableViewController.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQSingerTableViewController.h"
#import "JQSingerCollectionViewCell.h"

@interface JQSingerTableViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) JQSingerModel *model;
@property (nonatomic) UIView *headerView;
@property (nonatomic) UIPageControl *pc;
@end

@implementation JQSingerTableViewController

#pragma mark - collectionDatasource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.model.artist.count/3;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JQSingerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    SingerArtistModel *model = self.model.artist[indexPath.row];
    [cell.iconIv setImageURL:model.avatar_big.jq_URL];
    cell.nameLb.text = model.name;
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    self.pc.currentPage = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width + 0.5;
}
#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    [self.collectionView registerClass:[JQSingerCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    MJWeakSelf
    [self.tableView addHeaderRefresh:^{
        [NetManager getSingerHandler:^(JQSingerModel *model, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
                weakSelf.tableView.tableHeaderView = nil;
            }else{
                weakSelf.tableView.tableHeaderView = weakSelf.headerView;
                weakSelf.model = model;
                [weakSelf.collectionView reloadData];
                
            }
            [weakSelf.tableView endHeaderRefresh];
        }];
        
    }];
    [self.tableView beginHeaderRefresh];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    }
    if (section == 1) {
        return 3;
    }
    if (section == 2) {
        return 3;
    }
    if (section == 3) {
        return 3;
    }
    else {
        return 1;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.accessoryType = 1;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"华语男歌手";
                break;
            case 1:
                cell.textLabel.text = @"华语女歌手";
                break;
            case 2:
                cell.textLabel.text = @"华语乐队组合";
                break;
            case 3:
                cell.textLabel.text = @"百度原创音乐人";
                break;
                
        }
    }
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"欧美男歌手";
                break;
            case 1:
                cell.textLabel.text = @"欧美女歌手";
                break;
            case 2:
                cell.textLabel.text = @"欧美乐队组合";
                break;
                
        }
    }
    if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"韩国男歌手";
                break;
            case 1:
                cell.textLabel.text = @"韩国女歌手";
                break;
            case 2:
                cell.textLabel.text = @"韩国乐队组合";
                break;
                
        }
    }
    if (indexPath.section == 3) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"日本男歌手";
                break;
            case 1:
                cell.textLabel.text = @"日本女歌手";
                break;
            case 2:
                cell.textLabel.text = @"日本乐队组合";
                break;
                
        }
    }
    if (indexPath.section == 4) {
        
        cell.textLabel.text = @"其他歌手";
        
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
}
- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        CGFloat width = ([UIScreen mainScreen].bounds.size.width - 10 * 2 - 5 * 3) / 4;
        CGFloat height = width + 20;
        layout.itemSize = CGSizeMake(width, height);
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(10, 11, 10, 10);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, height * 2 + 30)) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
    }
    return _collectionView;
}

- (UIView *)headerView {
    if(_headerView == nil) {
        _headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, 0, 340))];
        UILabel *titleLb = [UILabel new];
        [_headerView addSubview:titleLb];
        titleLb.text = @"热门歌手";
        titleLb.font = [UIFont systemFontOfSize:16];
        [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20);
            make.centerX.equalTo(0);
        }];
        
        [_headerView addSubview:self.collectionView];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(titleLb.mas_bottom);
            make.height.equalTo(([UIScreen mainScreen].bounds.size.width - 10 * 2 - 5 * 3) / 2 + 80);
        }];
        
        UIPageControl *pc = [[UIPageControl alloc]init];
        self.pc = pc;
        pc.numberOfPages = 3;
        pc.currentPageIndicatorTintColor = [UIColor cyanColor];
        pc.pageIndicatorTintColor = [UIColor grayColor];
        pc.userInteractionEnabled = NO;
        [_headerView addSubview:pc];
        [pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_collectionView.mas_bottom).offset(-3);
            make.centerX.equalTo(0);
        }];
    }
    return _headerView;
}

@end
