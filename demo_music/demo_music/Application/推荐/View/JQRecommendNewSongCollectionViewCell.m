//
//  JQRecommendNewSongCollectionViewCell.m
//  demo_music
//
//  Created by tarena29 on 16/9/26.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQRecommendNewSongCollectionViewCell.h"

@implementation JQRecommendNewSongCollectionViewCell
- (UIImageView *)iconIv {
    if(_iconIv == nil) {
        _iconIv = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIv];
        [_iconIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.height.equalTo(_iconIv.mas_width);
        }];
    }
    return _iconIv;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        _titleLb.textColor = [UIColor colorWithWhite:0.114 alpha:1.000];
        _titleLb.font = [UIFont systemFontOfSize:14];
        _titleLb.numberOfLines = 0;
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            make.right.equalTo(0);
            make.height.lessThanOrEqualTo(35);
            make.top.equalTo(self.iconIv.mas_bottom).offset(10);
            
        }];
    }
    return _titleLb;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLb];
        _nameLb.textColor = [UIColor colorWithRed:0.435 green:0.435 blue:0.439 alpha:1.000];
        _nameLb.font = [UIFont systemFontOfSize:12];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLb.mas_bottom);
            make.left.equalTo(0);
            
        }];
    }
    return _nameLb;
}
@end
