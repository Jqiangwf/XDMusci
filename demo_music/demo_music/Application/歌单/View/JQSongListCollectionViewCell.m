//
//  JQSongListCollectionViewCell.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQSongListCollectionViewCell.h"

@implementation JQSongListCollectionViewCell
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        _iconIV.layer.shadowColor = [UIColor grayColor].CGColor;
        _iconIV.layer.shadowOpacity = 0.8;
        _iconIV.layer.shadowRadius = 2;
        _iconIV.layer.shadowOffset = CGSizeMake(2, 2);
        _iconIV.clipsToBounds = NO;
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20);
            make.left.right.equalTo(0);
            make.height.equalTo(_iconIV.mas_width);
            
        }];
        _iconIV.userInteractionEnabled = YES;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        UIImage *img = [[UIImage imageNamed:@"ic_limg_play_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [btn setImage:img forState:UIControlStateNormal];
        [_iconIV addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-3);
            make.bottom.equalTo(-3);
            make.size.equalTo(CGSizeMake(20, 20));
        }];
        
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:15];
        _titleLb.textColor = [UIColor colorWithWhite:0.133 alpha:1.000];
        _titleLb.numberOfLines = 0;
        _titleLb.font = [UIFont systemFontOfSize:13];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.height.lessThanOrEqualTo(60);
            make.top.equalTo(self.iconIV.mas_bottom).offset(15);
            make.bottom.equalTo(0);
            
        }];
    }
    return _titleLb;
}

- (UILabel *)countLb {
    if(_countLb == nil) {
        _countLb = [[UILabel alloc] init];
        
        
        [self.contentView addSubview:_countLb];
        _countLb.textColor = [UIColor whiteColor];
        _countLb.font = [UIFont systemFontOfSize:11];
        [_countLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.iconIV).offset(0);
            
            make.left.equalTo(self.iconIV).offset(2);
        }];
    }
    return _countLb;
}
@end
