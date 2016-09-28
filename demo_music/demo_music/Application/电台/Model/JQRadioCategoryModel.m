//
//  JQRadioCategoryModel.m
//  demo_music
//
//  Created by tarena29 on 16/9/26.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQRadioCategoryModel.h"

@implementation JQRadioCategoryModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"result" :[RadioCategoryResultModel class]};
}
@end
@implementation RadioCategoryResultModel

@end


