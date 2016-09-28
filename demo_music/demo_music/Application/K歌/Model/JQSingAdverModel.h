//
//  JQSingAdverModel.h
//  demo_music
//
//  Created by tarena29 on 16/9/23.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SingAdverResultModel;
@interface JQSingAdverModel : NSObject

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, strong) NSArray<SingAdverResultModel *> *result;

@end
@interface SingAdverResultModel : NSObject

@property (nonatomic, copy) NSString *picture;

@property (nonatomic, copy) NSString *picture_iphone6;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *web_url;

@end

