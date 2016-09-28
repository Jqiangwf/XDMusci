//
//  JQRankingDetailModel.h
//  demo_music
//
//  Created by tarena29 on 16/9/24.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RankingDetailBillboardModel,RankingDetailSongListModel;
@interface JQRankingDetailModel : NSObject

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, strong) NSArray<RankingDetailSongListModel *> *song_list;

@property (nonatomic, strong) RankingDetailBillboardModel *billboard;

@end
@interface RankingDetailBillboardModel : NSObject

@property (nonatomic, copy) NSString *billboard_type;

@property (nonatomic, copy) NSString *web_url;

@property (nonatomic, copy) NSString *update_date;

@property (nonatomic, copy) NSString *pic_s210;

@property (nonatomic, copy) NSString *pic_s640;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *pic_s444;

@property (nonatomic, copy) NSString *pic_s260;

@property (nonatomic, copy) NSString *billboard_songnum;

@property (nonatomic, copy) NSString *billboard_no;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger havemore;

@end

@interface RankingDetailSongListModel : NSObject

@property (nonatomic, copy) NSString *korean_bb_song;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, copy) NSString *pic_big;

@property (nonatomic, copy) NSString *rank_change;

@property (nonatomic, assign) NSInteger charge;

@property (nonatomic, copy) NSString *country;

@property (nonatomic, copy) NSString *piao_id;

@property (nonatomic, copy) NSString *resource_type_ext;

@property (nonatomic, copy) NSString *rank;

@property (nonatomic, assign) NSInteger havehigh;

@property (nonatomic, copy) NSString *lrclink;

@property (nonatomic, copy) NSString *pic_small;

@property (nonatomic, copy) NSString *hot;

@property (nonatomic, assign) NSInteger has_mv;

@property (nonatomic, copy) NSString *song_source;

@property (nonatomic, copy) NSString *all_artist_ting_uid;

@property (nonatomic, copy) NSString *publishtime;

@property (nonatomic, copy) NSString *is_new;

@property (nonatomic, copy) NSString *artist_name;

@property (nonatomic, assign) NSInteger file_duration;

@property (nonatomic, copy) NSString *toneid;

@property (nonatomic, copy) NSString *artist_id;

@property (nonatomic, copy) NSString *area;

@property (nonatomic, copy) NSString *album_id;

@property (nonatomic, copy) NSString *mv_provider;

@property (nonatomic, copy) NSString *style;

@property (nonatomic, copy) NSString *album_title;

@property (nonatomic, copy) NSString *del_status;

@property (nonatomic, assign) NSInteger learn;

@property (nonatomic, copy) NSString *album_no;

@property (nonatomic, copy) NSString *sound_effect;

@property (nonatomic, assign) NSInteger has_mv_mobile;

@property (nonatomic, copy) NSString *song_id;

@property (nonatomic, copy) NSString *bitrate_fee;

@property (nonatomic, copy) NSString *resource_type;

@property (nonatomic, assign) NSInteger is_first_publish;

@property (nonatomic, copy) NSString *all_rate;

@property (nonatomic, copy) NSString *ting_uid;

@property (nonatomic, copy) NSString *all_artist_id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *language;
//copy_type ->CopyType
@property (nonatomic, copy) NSString *CopyType;

@property (nonatomic, copy) NSString *versions;

@property (nonatomic, copy) NSString *relate_status;

@end

