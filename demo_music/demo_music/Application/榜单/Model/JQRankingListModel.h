//
//  JQRankingListModel.h
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RankingListContentModel,RankingListContentDataModel;
@interface JQRankingListModel : NSObject

@property (nonatomic, strong) NSArray<RankingListContentModel *> *content;

@property (nonatomic, assign) NSInteger error_code;

@end
@interface RankingListContentModel : NSObject

@property (nonatomic, strong) NSArray<RankingListContentDataModel *> *content;

@property (nonatomic, copy) NSString *web_url;

@property (nonatomic, copy) NSString *pic_s444;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, copy) NSString *pic_s192;

@property (nonatomic, copy) NSString *pic_s210;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *pic_s260;

@end

@interface RankingListContentDataModel : NSObject

@property (nonatomic, copy) NSString *author;

@property (nonatomic, copy) NSString *song_id;

@property (nonatomic, copy) NSString *album_id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *rank_change;

@property (nonatomic, copy) NSString *all_rate;

@property (nonatomic, copy) NSString *album_title;

@end

