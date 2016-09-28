//
//  JQSongListCollectionViewController.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQSongListCollectionViewController.h"
#import "SongListModel.h"
#import "JQSongListCollectionViewCell.h"
@interface JQSongListCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic) SongListModel *model;
@property (nonatomic) NSMutableArray *dataList;
@property (nonatomic) NSInteger page;
@property (nonatomic) UICollectionView *collectionView;
@end

@implementation JQSongListCollectionViewController

static NSString * const reuseIdentifier = @"Cell";



- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[JQSongListCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    MJWeakSelf
    [self.collectionView addHeaderRefresh:^{
        [NetManager getPage:1 handler:^(SongListModel *model, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                weakSelf.page = 1;
                [weakSelf.dataList removeAllObjects];
                weakSelf.model = model;
                [weakSelf.dataList addObjectsFromArray:model.content];
                [weakSelf.collectionView reloadData];
            }
            [weakSelf.collectionView endHeaderRefresh];
        }];
    }];
    [self.collectionView beginHeaderRefresh];
    
    [self.collectionView addFooterRefresh:^{
        [NetManager getPage:_page + 1 handler:^(SongListModel *model, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                weakSelf.page ++;
                weakSelf.model = model;
                [weakSelf.dataList addObjectsFromArray:model.content];
                
            }
            [weakSelf.collectionView endFooterRefresh];
        }];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark <UICollectionViewDataSource>




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JQSongListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    SongListContentModel *model = self.dataList[indexPath.item];
    [cell.iconIV setImageURL:model.pic_300.jq_URL];

    cell.titleLb.text = model.title;
    NSTextAttachment *att= [NSTextAttachment new];
    att.image =[UIImage imageNamed:@"icon_img1_headset"];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@""];
    NSAttributedString *imgStr = [NSAttributedString attributedStringWithAttachment:att];
    [str appendAttributedString:imgStr];
    NSAttributedString *textStr = [[NSAttributedString alloc]initWithString:model.listenum];
    [str appendAttributedString:textStr];
    [str addAttribute:NSBackgroundColorAttributeName value:[UIColor colorWithWhite:0.104 alpha:0.196] range:NSMakeRange(0, str.length)];
    cell.countLb.attributedText = str;
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

- (NSMutableArray *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray alloc] init];
    }
    return _dataList;
}

- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        CGFloat width = ([UIScreen mainScreen].bounds.size.width - 30 * 2 - 20 * 2) / 3;
        CGFloat height = width + 75;
        layout.itemSize = CGSizeMake(width, height);
        layout.minimumLineSpacing = 15;
        layout.minimumInteritemSpacing = 20;
        layout.sectionInset = UIEdgeInsetsMake(0, 30, 0, 30);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.left.right.bottom.equalTo(0);
        }];
    }
    return _collectionView;
}

@end
