//
//  UIView+HUD.h
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HUD)
- (void)showHUD;
- (void)hideHUD;

- (void)showMsg:(NSString *)msg;
@end
