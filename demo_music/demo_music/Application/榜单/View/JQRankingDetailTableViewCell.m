//
//  JQRankingDetailTableViewCell.m
//  demo_music
//
//  Created by tarena29 on 16/9/24.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQRankingDetailTableViewCell.h"

@implementation JQRankingDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)setNameLbWithSq:(BOOL)Sq MV:(BOOL)MV K:(BOOL)K name:(NSString *)name{
    if (Sq) {
        if(!_sqIv){
            _sqIv = [[UIImageView alloc]init];
        }
        _sqIv.hidden = NO;
        [self.contentView addSubview:_sqIv];
        [_sqIv setImage:[UIImage imageNamed:@"ic_playlist_sq"]];
        [_sqIv mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.titleLb);
            make.top.equalTo(self.titleLb.mas_bottom).offset(5);
            make.size.equalTo(CGSizeMake(15, 11));
        }];
        
        
    }else{
        _sqIv.hidden = YES;
    }
    if (MV) {
        if (!_mvIv) {
            _mvIv = [[UIImageView alloc]init];
            [self.contentView addSubview:_mvIv];
            [_mvIv setImage:[UIImage imageNamed:@"ic_playlist_mtv"]];
            [_mvIv mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.left.equalTo(self.titleLb).offset((19) * Sq);
                make.top.equalTo(self.titleLb.mas_bottom).offset(5);
                make.size.equalTo(CGSizeMake(15, 11));
            }];
        }else{
            [_mvIv mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.left.equalTo(self.titleLb).offset((19) * Sq);
                make.top.equalTo(self.titleLb.mas_bottom).offset(5);
                make.size.equalTo(CGSizeMake(15, 11));
            }];
        }
        _mvIv.hidden = NO;
        
    }else{
        _mvIv.hidden = YES;
    }
    if (K) {
        if (!_kIv) {
            _kIv = [[UIImageView alloc]init];
            [self.contentView addSubview:_kIv];
            [_kIv setImage:[UIImage imageNamed:@"ic_playlist_king"]];
            [_kIv mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.left.equalTo(self.titleLb).offset((19) * Sq + (19) * MV);
                make.top.equalTo(self.titleLb.mas_bottom).offset(2);
                make.size.equalTo(CGSizeMake(15, 14));
            }];
        }else{
            [_kIv mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.left.equalTo(self.titleLb).offset((19) * Sq + (19) * MV);
                make.top.equalTo(self.titleLb.mas_bottom).offset(2);
                make.size.equalTo(CGSizeMake(15, 14));
            }];
        }
        
        _kIv.hidden = NO;
    }else{
        _kIv.hidden = YES;
    }
    
    
    
    self.nameLb.textColor = [UIColor colorWithWhite:0.769 alpha:1.000];
    _nameLb.font = [UIFont systemFontOfSize:15];
    _nameLb.text = name;
    [_nameLb mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLb).offset((19) * Sq + (19) * MV + (19) * K);
        make.top.equalTo(self.titleLb.mas_bottom).offset(2);
        make.bottom.equalTo(-15);
    }];
    
    [self detaileBtn];
}
- (UILabel *)countLb {
    if(_countLb == nil) {
        _countLb = [[UILabel alloc] init];
        [self.contentView addSubview:_countLb];
        _countLb.font = [UIFont systemFontOfSize:19];
        [_countLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(25);
            make.top.equalTo(16);
            
        }];
    }
    return _countLb;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:19];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.countLb);
            make.left.equalTo(self.countLb.mas_right).offset(20);
            make.width.lessThanOrEqualTo(280);
        }];
    }
    return _titleLb;
}
- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLb);
            make.top.equalTo(self.titleLb.mas_bottom).offset(2);
            make.bottom.equalTo(-15);
        }];
    }
    return _nameLb;
}


- (UIButton *)detaileBtn {
    if(_detaileBtn == nil) {
        _detaileBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_detaileBtn];
        [_detaileBtn setImage:[UIImage imageNamed:@"ic_home_more_normal"] forState:UIControlStateNormal];
        [_detaileBtn setImage:[UIImage imageNamed:@"ic_home_more_press"] forState:UIControlStateSelected];
        [_detaileBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-30);
            make.centerY.equalTo(0);
        }];
        [_detaileBtn addTarget:self action:@selector(detailClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _detaileBtn;
}
- (void)detailClick:(UIButton *)btn{
    
}
@end
