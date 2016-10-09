//
//  JQSingTableViewCell.m
//  demo_music
//
//  Created by tarena29 on 16/10/8.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQSingTableViewCell.h"
#import "JQSingStaticCollectionViewCell.h"
@implementation JQSingTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(30);
            make.top.equalTo(_collectionView.mas_bottom).offset(15);
        }];
    }
    return _titleLb;
}
- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.sectionInset = UIEdgeInsetsMake(15, 30, 15, 30);
        layout.minimumLineSpacing = 25;
        layout.minimumInteritemSpacing = 15;
        layout.itemSize = CGSizeMake(90, 120);
        _collectionView = [[UICollectionView alloc] initWithFrame:(CGRectZero) collectionViewLayout:layout];
        [self.contentView addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.scrollEnabled = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[JQSingStaticCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.bottom.equalTo(-45);
        }];
    }
    return _collectionView;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JQSingStaticCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    switch (indexPath.item) {
        case 0:
            cell.iconIv.image = [UIImage imageNamed:@"img_k_ktv"];
            cell.titleLb.text = @"KTV热歌榜";
            break;
        case 1:
            cell.iconIv.image = [UIImage imageNamed:@"img_k_chinese"];
            cell.titleLb.text = @"华语金曲";
            break;
        case 2:
            cell.iconIv.image = [UIImage imageNamed:@"img_k_occident"];
            cell.titleLb.text = @"欧美经典";
            break;
        case 3:
            cell.iconIv.image = [UIImage imageNamed:@"img_k_man"];
            cell.titleLb.text = @"男歌手";
            break;
        case 4:
            cell.iconIv.image = [UIImage imageNamed:@"img_k_woman"];
            cell.titleLb.text = @"女歌手";
            break;
        case 5:
            cell.iconIv.image = [UIImage imageNamed:@"img_k_band"];
            cell.titleLb.text = @"乐队组合";
            break;
        default:
            break;
    }
    
    
    return cell;
}
@end
