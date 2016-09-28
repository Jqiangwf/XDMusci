//
//  UIScrollView+Refresh.h
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Refresh)

- (void)addHeaderRefresh:(void(^)(void))handler;
- (void)beginHeaderRefresh;
- (void)endHeaderRefresh;

- (void)addFooterRefresh:(void(^)(void))handler;
- (void)endFooterRefresh;
//结束刷新并且显示没有更多数据
- (void)endRefreshWithNoMoreData;
//重置没有更多数据状态
- (void)resetNoMoreData;
@end
