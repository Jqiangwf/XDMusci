//
//  SongListModel.h
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SongListContentModel;
@interface SongListModel : NSObject

@property (nonatomic, assign) NSInteger havemore;

@property (nonatomic, strong) NSArray<SongListContentModel *> *content;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger error_code;

@end
@interface SongListContentModel : NSObject

@property (nonatomic, copy) NSString *listid;

@property (nonatomic, copy) NSString *height;

@property (nonatomic, strong) NSArray<NSString *> *songIds;

@property (nonatomic, copy) NSString *collectnum;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *pic_300;

@property (nonatomic, copy) NSString *listenum;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *pic_w300;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *width;

@end

