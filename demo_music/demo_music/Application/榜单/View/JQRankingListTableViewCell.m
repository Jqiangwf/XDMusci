//
//  JQRankingListTableViewCell.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQRankingListTableViewCell.h"

@implementation JQRankingListTableViewCell

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
            make.bottom.equalTo(-18);
            make.left.top.equalTo(18);
            make.width.equalTo(85);
            make.height.equalTo(85).priorityHigh();
        }];
        _iconIv.userInteractionEnabled = YES;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        UIImage *img = [[UIImage imageNamed:@"ic_limg_play_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [btn setImage:img forState:UIControlStateNormal];
        [_iconIv addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-3);
            make.bottom.equalTo(-3);
            make.size.equalTo(CGSizeMake(20, 20));
        }];
    }
    return _iconIv;
}

- (UILabel *)firLb {
    if(_firLb == nil) {
        
        UILabel *numLb = [UILabel new];
        [self.contentView addSubview:numLb];
        numLb.text = @"1";
        numLb.textColor = [UIColor colorWithRed:0.929 green:0.392 blue:0.243 alpha:1.000];
        numLb.font = [UIFont systemFontOfSize:14];
        [numLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconIv).offset(10);
            make.left.equalTo(self.iconIv.mas_right).offset(15);
            
        }];
        
        _firLb = [[UILabel alloc] init];
        [self.contentView addSubview:_firLb];
        _firLb.font = [UIFont systemFontOfSize:14];
        [_firLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(numLb.mas_right).offset(5);
            make.centerY.equalTo(numLb);
            make.width.lessThanOrEqualTo(250);
        }];
        
    }
    return _firLb;
}

- (UILabel *)secLb {
    if(_secLb == nil) {
        _secLb = [[UILabel alloc] init];
        
        UILabel *numLb = [UILabel new];
        [self.contentView addSubview:numLb];
        numLb.text = @"2";
        numLb.textColor = [UIColor colorWithRed:0.929 green:0.392 blue:0.243 alpha:1.000];
        numLb.font = [UIFont systemFontOfSize:14];
        [numLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.firLb.mas_bottom).offset(10);
            make.left.equalTo(self.iconIv.mas_right).offset(15);
        }];
        
        _secLb = [[UILabel alloc] init];
        [self.contentView addSubview:_secLb];
        _secLb.font = [UIFont systemFontOfSize:14];
        [_secLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(numLb.mas_right).offset(5);
            make.centerY.equalTo(numLb);
            make.width.lessThanOrEqualTo(250);
        }];
    }
    return _secLb;
}

- (UILabel *)thiLb {
    if(_thiLb == nil) {
        _thiLb = [[UILabel alloc] init];
        
        UILabel *numLb = [UILabel new];
        [self.contentView addSubview:numLb];
        numLb.text = @"3";
        numLb.textColor = [UIColor colorWithRed:0.929 green:0.392 blue:0.243 alpha:1.000];
        numLb.font = [UIFont systemFontOfSize:14];
        [numLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.secLb.mas_bottom).offset(10);
            make.left.equalTo(self.iconIv.mas_right).offset(15);
        }];
        
        _thiLb = [[UILabel alloc] init];
        [self.contentView addSubview:_thiLb];
        _thiLb.font = [UIFont systemFontOfSize:14];
        [_thiLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(numLb.mas_right).offset(5);
            make.centerY.equalTo(numLb);
            make.width.lessThanOrEqualTo(250);
        }];
    }
    return _thiLb;
}



@end
