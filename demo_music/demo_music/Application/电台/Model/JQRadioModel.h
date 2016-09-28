//
//  JQRadioModel.h
//  demo_music
//
//  Created by tarena29 on 16/9/26.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RadioResultModel,RadioResultDataModel;
@interface JQRadioModel : NSObject

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, copy) NSString *error_message;

@property (nonatomic, strong) NSArray<RadioResultModel *> *result;

@end
@interface RadioResultModel : NSObject

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, copy) NSString *category_id;

@property (nonatomic, strong) NSArray<RadioResultDataModel *> *result;

@end

@interface RadioResultDataModel : NSObject

@property (nonatomic, copy) NSString *scene_name;

@property (nonatomic, copy) NSString *scene_model;

@property (nonatomic, copy) NSString *icon_android;

@property (nonatomic, copy) NSString *bgpic_android;

@property (nonatomic, copy) NSString *scene_desc;

@property (nonatomic, copy) NSString *icon_ios;

@property (nonatomic, copy) NSString *bgpic_ios;

@property (nonatomic, copy) NSString *scene_id;

@end

