//
//  JQSingTableViewCell.h
//  demo_music
//
//  Created by tarena29 on 16/10/8.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JQSingTableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UILabel *titleLb;



@end
