//
//  JQRecommendModel.m
//  demo_music
//
//  Created by tarena29 on 16/9/26.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQRecommendModel.h"

@implementation JQRecommendModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"module" :[Module class]};
}
@end
@implementation RecommendResultModel

@end

@implementation RecommendResultDataModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"result": [Result class]};
}
@end


@implementation RecommendResultSceneModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"config": [Config class]};
}
@end
@implementation RecommendSceneResult

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"emotion": [RecommendSceneResultData class], @"operation": [RecommendSceneResultData class],@"other": [RecommendSceneResultData class],@"action": [RecommendSceneResultData class]};
}

@end

@implementation RecommendSceneResultData


@end

@implementation Result

@end

@implementation Config

@end


@implementation Module

@end


