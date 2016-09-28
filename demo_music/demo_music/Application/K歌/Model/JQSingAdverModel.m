//
//  JQSingAdverModel.m
//  demo_music
//
//  Created by tarena29 on 16/9/23.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQSingAdverModel.h"

@implementation JQSingAdverModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"result": [SingAdverResultModel class]};
}
@end
@implementation SingAdverResultModel

@end


