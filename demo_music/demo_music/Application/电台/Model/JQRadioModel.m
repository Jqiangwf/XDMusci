//
//  JQRadioModel.m
//  demo_music
//
//  Created by tarena29 on 16/9/26.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQRadioModel.h"

@implementation JQRadioModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"result" :[RadioResultModel class]};
}
@end
@implementation RadioResultModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"result" :[RadioResultDataModel class]};
}
@end


@implementation RadioResultDataModel

@end


