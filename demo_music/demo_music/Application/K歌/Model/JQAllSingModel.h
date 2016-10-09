//
//  JQAllSingModel.h
//  demo_music
//
//  Created by tarena29 on 16/9/29.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JQAllSingResultModel,JQAllSingResultItemsModel;
@interface JQAllSingModel : NSObject

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, strong) JQAllSingResultModel *result;

@end
@interface JQAllSingResultModel : NSObject

@property (nonatomic, strong) NSArray<JQAllSingResultItemsModel *> *items;

@end

@interface JQAllSingResultItemsModel : NSObject

@property (nonatomic, copy) NSString *album_title;

@property (nonatomic, copy) NSString *artist_name;

@property (nonatomic, copy) NSString *play_num;

@property (nonatomic, copy) NSString *song_title;

@property (nonatomic, copy) NSString *picture_300_300;

@property (nonatomic, copy) NSString *song_id;

@end

