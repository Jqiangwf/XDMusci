//
//  JQAllSongTableViewCell.m
//  demo_music
//
//  Created by tarena29 on 16/10/8.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQAllSongTableViewCell.h"

@implementation JQAllSongTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (UIImageView *)iconIv {
    if(_iconIv == nil) {
        _iconIv = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIv];
        [_iconIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(10);
            make.width.height.equalTo(45);
        }];
    }
    return _iconIv;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:16];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIv.mas_right).offset(17);
            make.top.equalTo(self.iconIv.mas_top).offset(4);
            
        }];
    }
    return _titleLb;
}

- (UILabel *)countLb {
    if(_countLb == nil) {
        _countLb = [[UILabel alloc] init];
        [self.contentView addSubview:_countLb];
        _countLb.textColor = [UIColor colorWithRed:0.698 green:0.698 blue:0.702 alpha:1.000];
        _countLb.font = [UIFont systemFontOfSize:14];
        [_countLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLb);
            make.bottom.equalTo(self.iconIv.mas_bottom).offset(-4);
        }];
    }
    return _countLb;
}
- (UIButton *)singbtn {
    if(_singbtn == nil) {
        _singbtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_singbtn];
        [_singbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.iconIv);
            make.right.equalTo(-18);
            make.width.height.equalTo(25);
        }];

        [_singbtn setImage:[[UIImage imageNamed:@"bt_k_k_normail"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        
    }
    return _singbtn;
}
@end
