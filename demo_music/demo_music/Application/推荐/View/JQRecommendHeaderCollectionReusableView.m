//
//  JQRecommendHeaderCollectionReusableView.m
//  demo_music
//
//  Created by tarena29 on 16/9/27.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQRecommendHeaderCollectionReusableView.h"

@implementation JQRecommendHeaderCollectionReusableView
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(18);
            make.top.equalTo(15);
        }];
        
    }
    return _titleLb;
}

- (UIButton *)moreBtn {
    if(_moreBtn == nil) {
        _moreBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:_moreBtn];
        [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-18);
            make.centerY.equalTo(self.titleLb);
        }];
    }
    return _moreBtn;
}
@end
