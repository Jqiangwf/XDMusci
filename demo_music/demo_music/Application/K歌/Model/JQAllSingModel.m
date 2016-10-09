//
//  JQAllSingModel.m
//  demo_music
//
//  Created by tarena29 on 16/9/29.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQAllSingModel.h"

@implementation JQAllSingModel

@end



@implementation JQAllSingResultModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"items": [JQAllSingResultItemsModel class]};
}
@end


@implementation JQAllSingResultItemsModel

@end


