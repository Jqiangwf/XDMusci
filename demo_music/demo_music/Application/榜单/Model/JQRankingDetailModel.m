//
//  JQRankingDetailModel.m
//  demo_music
//
//  Created by tarena29 on 16/9/24.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQRankingDetailModel.h"

@implementation JQRankingDetailModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"song_list": [RankingDetailSongListModel class]};
}
@end
@implementation RankingDetailBillboardModel

@end


@implementation RankingDetailSongListModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"CopyType": @"copy_type"};
}
@end


