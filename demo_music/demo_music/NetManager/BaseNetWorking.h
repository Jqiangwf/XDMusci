//
//  BaseNetWorking.h
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetWorking : NSObject
+ (id)GET:(NSString *)path parameters:(NSDictionary *)parameters handler:(void(^)(id response , NSError *error))handler;
@end
