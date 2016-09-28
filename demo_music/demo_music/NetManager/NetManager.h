//
//  NetManager.h
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SongListModel.h"
#import "BaseNetWorking.h"
#import "JQRankingListModel.h"
#import "JQSingerModel.h"
#import "JQSingAdverModel.h"
#import "JQRankingDetailModel.h"
#import "JQRadioModel.h"
#import "JQRadioCategoryModel.h"
#import "JQRecommendModel.h"

@interface NetManager : BaseNetWorking

+ (id)getPage:(NSInteger)page handler:(void(^)(SongListModel *model,NSError *error))handler;
+ (id)getRankingListHandler:(void(^)(JQRankingListModel *model,NSError *error))handler;
+ (id)getSingerHandler:(void(^)(JQSingerModel *model,NSError *error))handler;
+ (id)getSingAdverHandler:(void(^)(JQSingAdverModel *model,NSError *error))handler;
+ (id)getRankingDetail:(NSInteger)type handler:(void(^)(JQRankingDetailModel *model,NSError *error))handler;
+ (id)getRadioHandler:(void(^)(JQRadioModel *model,NSError *error))handler;
+ (id)getRadioCategory:(NSInteger)ID handler:(void(^)(JQRadioCategoryModel *model,NSError *error))handler;
+ (id)getRecommendHandler:(void(^)(JQRecommendModel *model,NSError *error))handler;

@end
