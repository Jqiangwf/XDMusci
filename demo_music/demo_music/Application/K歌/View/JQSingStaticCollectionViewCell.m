//
//  JQSingStaticCollectionViewCell.m
//  demo_music
//
//  Created by tarena29 on 16/10/8.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQSingStaticCollectionViewCell.h"

@implementation JQSingStaticCollectionViewCell
- (UIImageView *)iconIv {
    if(_iconIv == nil) {
        _iconIv = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIv];
        [_iconIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.height.equalTo(_iconIv.mas_width);
        }];
        _iconIv.layer.cornerRadius = 45;
        _iconIv.layer.masksToBounds = YES;
        
    }
    return _iconIv;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.bottom.equalTo(0);
        }];
    }
    return _titleLb;
}
@end
