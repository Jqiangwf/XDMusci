//
//  SongListModel.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "SongListModel.h"

@implementation SongListModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"content" :[SongListContentModel class]};
}
@end
@implementation SongListContentModel

@end


