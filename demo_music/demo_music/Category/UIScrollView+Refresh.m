//
//  UIScrollView+Refresh.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "UIScrollView+Refresh.h"

@implementation UIScrollView (Refresh)
- (void)addHeaderRefresh:(void (^)(void))handler{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:handler];
}
- (void)beginHeaderRefresh{
    [self.mj_header beginRefreshing];
}
-(void)endHeaderRefresh{
    [self.mj_header endRefreshing];
}

-(void)addFooterRefresh:(void (^)(void))handler{
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:handler];
}
- (void)endFooterRefresh{
    [self.mj_footer endRefreshing];
}
- (void)endRefreshWithNoMoreData{
    [self.mj_footer endRefreshingWithNoMoreData];
}
- (void)resetNoMoreData{
    [self.mj_footer resetNoMoreData];
}
@end
