//
//  NetManager.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "NetManager.h"

#define kSongListPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.diy.gedan&page_no=%ld&page_size=30&from=ios&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"
#define kRankingListPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.billboard.billCategory&format=json&from=ios&kflag=2&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"
#define kSingerPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.artist.getList&format=json&order=1&limit=24&offset=0&area=0&sex=0&abc=&from=ios&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"
#define kSingAdverPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.active.showList&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"
#define kRankingDetailPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.billboard.billList&type=%ld&format=json&offset=0&size=100&from=ios&fields=title,song_id,author,resource_type,havehigh,is_new,has_mv_mobile,album_title,ting_uid,album_id,charge,all_rate,mv_provider&from=ios&version=5.8.3&cuid=24fc6b080e10ed8522fbb16da65619eafdf1db28&channel=appstore&operator=0"
#define kSongPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.song.getInfos&ts=1475164135&songid=%@&nw=2&l2p=395.1&lpb=320000&ext=MP3&format=json&from=ios&usup=1&lebo=0&aac=0&ucf=4&vid=&res=1&e=FuQ105WnGRfnAYDe2H%%2FYvCkKi8tA3QhyC6fmlIiYJHY%%3D&channel=24fc6b080e10ed8522fbb16da65619eafdf1db28&cuid=appstore&from=ios&version=5.9.0"
#define kRadioPath @"http://tingapi.ting.baidu.com/v1/restserver/ting/?method=baidu.ting.scene.getCategoryList&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"
#define kRadioCategoryPath @"http://tingapi.ting.baidu.com/v1/restserver/ting/?method=baidu.ting.scene.getCategoryScene&category_id=%ld&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"
#define kRadioRecommendPath @"http://tingapi.ting.baidu.com/v1/restserver/ting/?method=baidu.ting.scene.getCategoryScene&category_id=1&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"
#define kRecommendPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.plaza.index&from=ios&version=5.8.3&cuid=ea1a454da4143efa1d2d470113751b76932a9e27&channel=appstore&operator=0"
#define kAllSingPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.learn.now&from=ios&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"
@implementation NetManager

+ (id)getPage:(NSInteger)page handler:(void (^)(SongListModel *, NSError *))handler{
    return [self GET:[NSString stringWithFormat:kSongListPath, page] parameters:nil handler:^(id response, NSError *error) {
        !handler ?: handler([SongListModel parse:response],error);
    }];
}
+ (id)getRankingListHandler:(void (^)(JQRankingListModel *, NSError *))handler{
    return [self GET:kRankingListPath parameters:nil handler:^(id response, NSError *error) {
        !handler ?:handler([JQRankingListModel parse:response],error);
    }];
}
+ (id)getSingerHandler:(void (^)(JQSingerModel *, NSError *))handler{
    return [self GET:kSingerPath parameters:nil handler:^(id response, NSError *error) {
        !handler ?: handler([JQSingerModel parse:response],error);
    }];
}
+ (id)getSingAdverHandler:(void (^)(JQSingAdverModel *, NSError *))handler{
    return [self GET:kSingAdverPath parameters:nil handler:^(id response, NSError *error) {
        !handler ?: handler([JQSingAdverModel parse:response],error);
    }];
}
+ (id)getRankingDetail:(NSInteger)type handler:(void (^)(JQRankingDetailModel *, NSError *))handler{
    return [self GET:[NSString stringWithFormat:kRankingDetailPath,type] parameters:nil handler:^(id response, NSError *error) {
        !handler ?: handler ([JQRankingDetailModel parse:response],error);
    }];
}
+ (id)getRadioHandler:(void (^)(JQRadioModel *, NSError *))handler{
    return [self GET:kRadioPath parameters:nil handler:^(id response, NSError *error) {
        !handler ?: handler([JQRadioModel parse:response],error);
    }];
}
+ (id)getRadioCategory:(NSInteger)ID handler:(void (^)(JQRadioCategoryModel *, NSError *))handler{
    return [self GET:[NSString stringWithFormat:kRadioCategoryPath,ID] parameters:nil handler:^(id response, NSError *error) {
        !handler ?: handler([JQRadioCategoryModel parse:response],error);
    }];
}
+ (id)getRadioCategoryHandler:(void (^)(JQRadioCategoryModel *, NSError *))handler{
    return [self GET:kRadioRecommendPath parameters:nil handler:^(id response, NSError *error) {
        !handler ?:handler([JQRadioCategoryModel parse:response],error);
    }];
}
+ (id)getRecommendHandler:(void (^)(JQRecommendModel *, NSError *))handler{
    return [self GET:kRecommendPath parameters:nil handler:^(id response, NSError *error) {
        !handler ?: handler([JQRecommendModel parse:response],error);
    }];
}
+ (id)getSongID:(NSString *)songID handler:(void (^)(JQSongModel *, NSError *))handler{
    return [self GET:[NSString stringWithFormat:kSongPath,songID] parameters:nil handler:^(id response, NSError *error) {
        !handler ?:handler([JQSongModel parse:response],error);
    }];
}
+ (id)getAllSingHandler:(void (^)(JQAllSingModel *, NSError *))handler{
    return [self GET:kAllSingPath parameters:nil handler:^(id response, NSError *error) {
        !handler ?:handler([JQAllSingModel parse:response],error);
    }];
}
@end
