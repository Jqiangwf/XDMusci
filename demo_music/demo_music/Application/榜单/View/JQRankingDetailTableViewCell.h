//
//  JQRankingDetailTableViewCell.h
//  demo_music
//
//  Created by tarena29 on 16/9/24.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JQRankingDetailTableViewCell : UITableViewCell
@property (nonatomic) UILabel *countLb;
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) UILabel *nameLb;
@property (nonatomic) UIButton *detaileBtn;
@property (nonatomic) UIImageView *sqIv;
@property (nonatomic) UIImageView *mvIv;
@property (nonatomic) UIImageView *kIv;
- (void)setNameLbWithSq:(BOOL)Sq MV:(BOOL)MV K:(BOOL)K name:(NSString *)name;


@end
