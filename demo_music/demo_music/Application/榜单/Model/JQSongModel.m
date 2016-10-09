//
//  JQSongModel.m
//  demo_music
//
//  Created by tarena29 on 16/9/30.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQSongModel.h"

@implementation JQSongModel

@end
@implementation JqSongurlModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"url" :[Url class]};
}
@end


@implementation Url

@end


@implementation JQSonginfoModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"type" :@"copy_type"};
}
@end


