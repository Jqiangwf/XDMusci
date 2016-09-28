//
//  NSString+Jq.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "NSString+Jq.h"

@implementation NSString (Jq)
- (NSURL *)jq_URL{
    return [NSURL URLWithString:self];
}
@end
