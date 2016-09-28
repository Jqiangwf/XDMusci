//
//  JQSingerCollectionViewCell.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQSingerCollectionViewCell.h"

@implementation JQSingerCollectionViewCell
- (UIImageView *)iconIv {
    if(_iconIv == nil) {
        _iconIv = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIv];
        [_iconIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.height.equalTo(_iconIv.mas_width);
        }];
        _iconIv.layer.cornerRadius = self.contentView.bounds.size.width / 2.0 ;
        _iconIv.layer.masksToBounds = YES;
    }
    return _iconIv;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLb];
        _nameLb.font = [UIFont systemFontOfSize:13];
        _nameLb.textAlignment = NSTextAlignmentCenter;
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.bottom.equalTo(0);
        }];
        
    }
    return _nameLb;
}
@end
