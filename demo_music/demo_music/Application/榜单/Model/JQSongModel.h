//
//  JQSongModel.h
//  demo_music
//
//  Created by tarena29 on 16/9/30.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JqSongurlModel,Url,JQSonginfoModel;
@interface JQSongModel : NSObject

@property (nonatomic, strong) JqSongurlModel *songurl;

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, strong) JQSonginfoModel *songinfo;

@end
@interface JqSongurlModel : NSObject

@property (nonatomic, strong) NSArray<Url *> *url;

@end

@interface Url : NSObject

@property (nonatomic, assign) NSInteger can_see;

@property (nonatomic, assign) NSInteger file_bitrate;

@property (nonatomic, assign) NSInteger down_type;

@property (nonatomic, copy) NSString *replay_gain;

@property (nonatomic, assign) BOOL can_load;

@property (nonatomic, copy) NSString *hash;

@property (nonatomic, assign) NSInteger original;

@property (nonatomic, copy) NSString *show_link;

@property (nonatomic, assign) NSInteger preload;

@property (nonatomic, copy) NSString *file_link;

@property (nonatomic, copy) NSString *file_extension;

@property (nonatomic, assign) NSInteger file_size;

@property (nonatomic, assign) NSInteger is_udition_url;

@property (nonatomic, assign) NSInteger free;

@property (nonatomic, assign) NSInteger file_duration;

@property (nonatomic, assign) NSInteger song_file_id;

@end

@interface JQSonginfoModel : NSObject

@property (nonatomic, copy) NSString *piao_id;

@property (nonatomic, copy) NSString *pic_radio;

@property (nonatomic, copy) NSString *artist_id;

@property (nonatomic, assign) NSInteger original;
//copy_type -> type
@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *del_status;

@property (nonatomic, copy) NSString *artist_500_500;

@property (nonatomic, copy) NSString *publishtime;

@property (nonatomic, copy) NSString *pic_small;

@property (nonatomic, copy) NSString *relate_status;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *compose;

@property (nonatomic, copy) NSString *songwriting;

@property (nonatomic, copy) NSString *pic_big;

@property (nonatomic, copy) NSString *album_title;

@property (nonatomic, copy) NSString *korean_bb_song;

@property (nonatomic, copy) NSString *area;

@property (nonatomic, copy) NSString *pic_huge;

@property (nonatomic, copy) NSString *high_rate;

@property (nonatomic, assign) NSInteger play_type;

@property (nonatomic, copy) NSString *resource_type;

@property (nonatomic, assign) NSInteger learn;

@property (nonatomic, copy) NSString *album_no;

@property (nonatomic, assign) NSInteger havehigh;

@property (nonatomic, copy) NSString *compress_status;

@property (nonatomic, copy) NSString *pic_singer;

@property (nonatomic, copy) NSString *all_rate;

@property (nonatomic, assign) NSInteger is_first_publish;

@property (nonatomic, copy) NSString *multiterminal_copytype;

@property (nonatomic, copy) NSString *artist_640_1136;

@property (nonatomic, copy) NSString *ting_uid;

@property (nonatomic, assign) NSInteger share_num;

@property (nonatomic, copy) NSString *country;

@property (nonatomic, copy) NSString *pic_premium;

@property (nonatomic, copy) NSString *lrclink;

@property (nonatomic, copy) NSString *aliasname;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, copy) NSString *song_id;

@property (nonatomic, copy) NSString *song_source;

@property (nonatomic, copy) NSString *bitrate;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, copy) NSString *all_artist_id;

@property (nonatomic, copy) NSString *album_500_500;

@property (nonatomic, copy) NSString *original_rate;

@property (nonatomic, copy) NSString *album_id;

@property (nonatomic, copy) NSString *file_duration;

@property (nonatomic, assign) NSInteger expire;

@property (nonatomic, copy) NSString *versions;

@property (nonatomic, assign) NSInteger has_mv;

@property (nonatomic, copy) NSString *artist_1000_1000;

@property (nonatomic, copy) NSString *toneid;

@property (nonatomic, copy) NSString *album_1000_1000;

@property (nonatomic, copy) NSString *resource_type_ext;

@property (nonatomic, copy) NSString *hot;

@property (nonatomic, assign) NSInteger has_mv_mobile;

@property (nonatomic, assign) NSInteger comment_num;

@property (nonatomic, copy) NSString *is_charge;

@property (nonatomic, copy) NSString *language;

@property (nonatomic, copy) NSString *distribution;

@property (nonatomic, assign) NSInteger collect_num;

@property (nonatomic, copy) NSString *artist_480_800;

@property (nonatomic, assign) NSInteger charge;

@property (nonatomic, copy) NSString *sound_effect;

@end

