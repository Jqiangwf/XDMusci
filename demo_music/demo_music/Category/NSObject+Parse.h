//
//  NSObject+Parse.h
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Parse)<YYModel>
+ (id)parse:(id)json;
@end
