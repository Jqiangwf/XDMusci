//
//  JQRecommendModel.h
//  demo_music
//
//  Created by tarena29 on 16/9/26.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RecommendResultModel,RecommendResultSceneModel,Result,Module,RecommendResultDataModel,RecommendSceneResultData,RecommendSceneResult,Config;
@interface JQRecommendModel : NSObject

@property (nonatomic, strong) RecommendResultModel *result;

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, strong) NSArray<Module *> *module;

@end
@interface RecommendResultModel : NSObject

@property (nonatomic, strong) RecommendResultDataModel *mix_22;

@property (nonatomic, strong) RecommendResultSceneModel *scene;

@property (nonatomic, strong) RecommendResultDataModel *focus;

@property (nonatomic, strong) RecommendResultDataModel *radio;

@property (nonatomic, strong) RecommendResultDataModel *diy;

@property (nonatomic, strong) RecommendResultDataModel *entry;

@property (nonatomic, strong) RecommendResultDataModel *mix_5;

@property (nonatomic, strong) RecommendResultDataModel *recsong;

@property (nonatomic, strong) RecommendResultDataModel *mix_9;

@property (nonatomic, strong) RecommendResultDataModel *album;

@property (nonatomic, strong) RecommendResultDataModel *mod_7;

@end

@interface RecommendResultDataModel : NSObject

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, strong) NSArray<Result *> *result;

@end



@interface RecommendResultSceneModel : NSObject

@property (nonatomic, strong) RecommendSceneResult *result;

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, strong) NSArray<Config *> *config;

@end

@interface RecommendSceneResult : NSObject

@property (nonatomic, strong) NSArray<RecommendSceneResultData *> *emotion;

@property (nonatomic, strong) NSArray<RecommendSceneResultData *> *operation;

@property (nonatomic, strong) NSArray<RecommendSceneResultData *> *other;

@property (nonatomic, strong) NSArray<RecommendSceneResultData *> *action;

@end


@interface RecommendSceneResultData : NSObject

@property (nonatomic, copy) NSString *scene_desc;

@property (nonatomic, copy) NSString *bgpic_ios;

@property (nonatomic, copy) NSString *icon_android;

@property (nonatomic, copy) NSString *bgpic_android;

@property (nonatomic, copy) NSString *scene_id;

@property (nonatomic, copy) NSString *icon_ios;

@property (nonatomic, copy) NSString *scene_model;

@property (nonatomic, copy) NSString *scene_name;

@end



@interface Result : NSObject
@property (nonatomic, copy) NSString *author;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *type_id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger tip_type;

@property (nonatomic, copy) NSString *is_publish;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *randpic_iphone6;

@property (nonatomic, copy) NSString *randpic_desc;

@property (nonatomic, copy) NSString *randpic;

@property (nonatomic, assign) NSInteger mo_type;



@property (nonatomic, copy) NSString *itemid;

@property (nonatomic, copy) NSString *album_id;

@property (nonatomic, copy) NSString *channelid;


@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *day;

@property (nonatomic, copy) NSString *jump;

@property (nonatomic, copy) NSString *del_status;

@property (nonatomic, copy) NSString *bitrate_fee;

@property (nonatomic, copy) NSString *song_id;

@property (nonatomic, copy) NSString *resource_type_ext;

@property (nonatomic, copy) NSString *versions;


@property (nonatomic, copy) NSString *korean_bb_song;

@property (nonatomic, copy) NSString *has_mv_mobile;

@property (nonatomic, copy) NSString *pic_premium;

@property (nonatomic, copy) NSString *learn;



@property (nonatomic, copy) NSString *listid;

@property (nonatomic, assign) NSInteger position;



@property (nonatomic, assign) NSInteger collectnum;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, strong) NSArray *songidlist;



@property (nonatomic, assign) NSInteger listenum;



@end
@interface Config : NSObject

@property (nonatomic, copy) NSString *play_color;

@property (nonatomic, assign) NSInteger scene_version;

@property (nonatomic, assign) NSInteger end_time;

@property (nonatomic, copy) NSString *button_color;

@property (nonatomic, copy) NSString *bgpic_special;

@property (nonatomic, assign) NSInteger start_time;

@property (nonatomic, copy) NSString *color_other;

@property (nonatomic, copy) NSString *bgpic;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *scene_color;

@end

@interface Module : NSObject

@property (nonatomic, copy) NSString *picurl;

@property (nonatomic, assign) NSInteger style;

@property (nonatomic, copy) NSString *link_url;

@property (nonatomic, copy) NSString *title_more;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *key;

@property (nonatomic, assign) NSInteger pos;

@property (nonatomic, copy) NSString *jump;

@end

