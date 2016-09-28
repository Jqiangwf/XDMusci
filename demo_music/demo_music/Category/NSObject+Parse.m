//
//  NSObject+Parse.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "NSObject+Parse.h"

@implementation NSObject (Parse)
+(id)parse:(id)json{
    if ([json isKindOfClass:[NSArray class]]) {
        return [NSArray modelArrayWithClass:[self class] json:json];
    }
    if ([json isKindOfClass:[NSDictionary class]]) {
        return [self modelWithDictionary:json];
    }
    return json;
}
@end
