//
//  JQRecommendProprietaryCollectionViewCell.m
//  demo_music
//
//  Created by tarena29 on 16/9/27.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQRecommendProprietaryCollectionViewCell.h"

@implementation JQRecommendProprietaryCollectionViewCell

- (UIImageView *)iconIv {
    if(_iconIv == nil) {
        _iconIv = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIv];
        [_iconIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(17);
            make.centerY.equalTo(0);
            make.size.equalTo(CGSizeMake(40, 40));
        }];
    }
    return _iconIv;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        _titleLb.textColor = [UIColor colorWithRed:0.176 green:0.180 blue:0.188 alpha:1.000];
        _titleLb.font = [UIFont systemFontOfSize:15];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIv.mas_right).offset(15);
            make.top.equalTo(self.iconIv).offset(2);
        }];
    }
    return _titleLb;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLb];
        _nameLb.textColor = [UIColor colorWithRed:0.620 green:0.620 blue:0.624 alpha:1.000];
        _nameLb.font = [UIFont systemFontOfSize:12];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLb);
            make.bottom.equalTo(self.iconIv).offset(-2);
        }];
        
    }
    return _nameLb;
}

@end
