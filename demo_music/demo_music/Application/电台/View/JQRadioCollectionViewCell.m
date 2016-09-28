//
//  JQRadioCollectionViewCell.m
//  demo_music
//
//  Created by tarena29 on 16/9/26.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQRadioCollectionViewCell.h"

@implementation JQRadioCollectionViewCell
- (UIImageView *)iconIv {
    if(_iconIv == nil) {
        _iconIv = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIv];

        [_iconIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20);
            make.right.equalTo(-20);
            make.top.equalTo(0);
            make.height.equalTo(_iconIv.mas_width);
        }];
    }
    return _iconIv;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLb];
        _nameLb.textColor = [UIColor colorWithRed:0.463 green:0.737 blue:0.949 alpha:1.000];
        _nameLb.font = [UIFont systemFontOfSize:14];
        _nameLb.textAlignment = NSTextAlignmentCenter;
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_iconIv.mas_bottom);
            make.bottom.left.right.equalTo(0);
        
        }];
    }
    return _nameLb;
}

@end
