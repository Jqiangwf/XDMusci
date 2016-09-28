//
//  JQSingerModel.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQSingerModel.h"

@implementation JQSingerModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"artist" :[SingerArtistModel class]};
}
@end
@implementation SingerArtistModel

@end


