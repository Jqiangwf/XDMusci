//
//  JQSingerModel.h
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SingerArtistModel;
@interface JQSingerModel : NSObject

@property (nonatomic, assign) NSInteger nums;

@property (nonatomic, assign) NSInteger havemore;

@property (nonatomic, copy) NSString *noFirstChar;

@property (nonatomic, strong) NSArray<SingerArtistModel *> *artist;

@end
@interface SingerArtistModel : NSObject

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, copy) NSString *avatar_middle;

@property (nonatomic, copy) NSString *avatar_small;

@property (nonatomic, copy) NSString *piao_id;

@property (nonatomic, copy) NSString *albums_total;

@property (nonatomic, copy) NSString *artist_id;

@property (nonatomic, copy) NSString *avatar_big;

@property (nonatomic, copy) NSString *songs_total;

@property (nonatomic, copy) NSString *area;

@property (nonatomic, copy) NSString *firstchar;

@property (nonatomic, copy) NSString *avatar_mini;

@property (nonatomic, copy) NSString *country;

@property (nonatomic, copy) NSString *ting_uid;

@property (nonatomic, copy) NSString *name;

@end

