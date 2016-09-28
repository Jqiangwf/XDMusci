//
//  JQRankingListModel.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQRankingListModel.h"

@implementation JQRankingListModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"content" :[RankingListContentModel class]};
}
@end
@implementation RankingListContentModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"content" :[RankingListContentDataModel class]};
}
@end


@implementation RankingListContentDataModel

@end


