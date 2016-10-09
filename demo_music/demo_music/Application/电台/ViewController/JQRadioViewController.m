//
//  JQRadioViewController.m
//  demo_music
//
//  Created by tarena29 on 16/9/26.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQRadioViewController.h"
#import "JQRadioModel.h"
#import "JQRadioCollectionViewCell.h"
#import "JQRadioCategoryModel.h"

@interface JQRadioViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic) UITableView *tableView;
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) JQRadioModel *model;
@property (nonatomic) JQRadioCategoryModel *categoryModel;
@property (nonatomic) NSInteger selNum;
@property (nonatomic) NSMutableDictionary *dataDic;



@end

@implementation JQRadioViewController
#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    [self collectionView];
    [self.collectionView registerClass:[JQRadioCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    [NetManager getRadioHandler:^(JQRadioModel *model, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }else{
            self.model = model;
            [self.tableView reloadData];
        }
        
    }];
    [NetManager getRadioCategoryHandler:^(JQRadioCategoryModel *model, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }else{
            self.categoryModel = model;
            [self.collectionView reloadData];
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.model.result.count + 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (self.model)
        if (indexPath.row == 0) {
            cell.textLabel.text = @"推荐";
            cell.textLabel.textColor = [UIColor colorWithRed:0.522 green:0.525 blue:0.529 alpha:1.000];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            indexPath.row == _selNum ? cell.textLabel.textColor = [UIColor colorWithRed:0.306 green:0.604 blue:0.973 alpha:1.000] : nil;
            return cell;
        }
    
    RadioResultModel *model = self.model.result[indexPath.row - 1];
    cell.textLabel.text = model.category_name;
    cell.textLabel.textColor = [UIColor colorWithRed:0.522 green:0.525 blue:0.529 alpha:1.000];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    if (indexPath.row == _selNum) {
        cell.textLabel.textColor = [UIColor colorWithRed:0.306 green:0.604 blue:0.973 alpha:1.000];

    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selNum = indexPath.row;
    [tableView reloadData];
    if (self.dataDic[@(indexPath.row)]) {
        [self.collectionView reloadData];
        return;
    }
    
    if (indexPath.row == 0) {
        [NetManager getRadioCategoryHandler:^(JQRadioCategoryModel *model, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                self.categoryModel = model;
                [self.dataDic setObject:model forKey:@(indexPath.row)];
                [self.collectionView reloadData];
            }
        }];
    }else{
     
        [NetManager getRadioCategory:self.selNum - 1 handler:^(JQRadioCategoryModel *model, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                self.categoryModel = model;
                [self.dataDic setObject:model forKey:@(indexPath.row)];
                [self.collectionView reloadData];
            }
        }];
    
    }
}

#pragma mark - collectionView dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.dataDic[@(_selNum)])
      return ((JQRadioCategoryModel *)self.dataDic[@(_selNum)]).result.count;
    return self.categoryModel.result.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    __weak JQRadioCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    RadioCategoryResultModel *model;
    if (!self.dataDic[@(_selNum)]){
        model = self.categoryModel.result[indexPath.item];
    }else{
        model = ((JQRadioCategoryModel *)self.dataDic[@(_selNum)]).result[indexPath.item];
    }
    [cell.iconIv setImageWithURL:model.icon_ios.jq_URL placeholder:[UIImage imageNamed:@"ad_play_cover_pic_bg"] options:YYWebImageOptionShowNetworkActivity completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
        cell.iconIv.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        cell.iconIv.tintColor = [UIColor colorWithRed:0.490 green:0.686 blue:0.902 alpha:1.000];
    }];
    
    cell.nameLb.text = model.scene_name;
    
    return cell;
}

#pragma mark - lazy
- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] init];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.equalTo(0);
            make.top.equalTo(50);
            make.right.equalTo(-([UIScreen mainScreen].bounds.size.width - 85));
        }];
        
        UIView *rv = [[UIView alloc]init];
        [self.view addSubview:rv];
        rv.backgroundColor = [UIColor colorWithWhite:0.873 alpha:1.000];
        [rv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_tableView);
            make.left.equalTo(_tableView.mas_right);
            make.width.equalTo(1);
        }];
	}
	return _tableView;
}

- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.sectionInset = UIEdgeInsetsMake(5, 25, 0, 25);
        CGFloat width = ([UIScreen mainScreen].bounds.size.width - 85 - 25 * 2 - 30 * 2 - 1) / 3;
        layout.itemSize = CGSizeMake(width, width);
        layout.minimumLineSpacing = 25;
        layout.minimumInteritemSpacing = 30;
		_collectionView = [[UICollectionView alloc] initWithFrame:(CGRectZero) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tableView);
            make.left.equalTo(self.tableView.mas_right).offset(1);
            make.right.bottom.equalTo(0);
        }];
	}
	return _collectionView;
}
- (NSMutableDictionary *)dataDic{
    if (!_dataDic) {
        _dataDic = [NSMutableDictionary dictionary];
    }
    return _dataDic;
}
@end
