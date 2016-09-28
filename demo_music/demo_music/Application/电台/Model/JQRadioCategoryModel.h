//
//  JQRadioCategoryModel.h
//  demo_music
//
//  Created by tarena29 on 16/9/26.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RadioCategoryResultModel;
@interface JQRadioCategoryModel : NSObject

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, copy) NSString *error_message;

@property (nonatomic, strong) NSArray<RadioCategoryResultModel *> *result;

@end
@interface RadioCategoryResultModel : NSObject

@property (nonatomic, copy) NSString *scene_name;

@property (nonatomic, copy) NSString *scene_model;

@property (nonatomic, copy) NSString *icon_android;

@property (nonatomic, copy) NSString *bgpic_android;

@property (nonatomic, copy) NSString *scene_desc;

@property (nonatomic, copy) NSString *icon_ios;

@property (nonatomic, copy) NSString *bgpic_ios;

@property (nonatomic, copy) NSString *scene_id;

@end

