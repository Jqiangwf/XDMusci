//
//  JQRecommendSongListCollectionViewCell.m
//  demo_music
//
//  Created by tarena29 on 16/9/26.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQRecommendSongListCollectionViewCell.h"

@implementation JQRecommendSongListCollectionViewCell
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
        _titleLb.font = [UIFont systemFontOfSize:14];
        _titleLb.textColor = [UIColor colorWithRed:0.263 green:0.263 blue:0.267 alpha:1.000];
        _titleLb.numberOfLines = 0;
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(self.iconIv.mas_bottom).offset(10);
            make.height.lessThanOrEqualTo(35);
        }];
        
    }
    return _titleLb;
}
@end
