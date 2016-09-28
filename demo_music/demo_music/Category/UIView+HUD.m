//
//  UIView+HUD.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "UIView+HUD.h"

@implementation UIView (HUD)
-(void)showHUD{
    [self hideHUD];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    //转圈最多30s
    [hud hideAnimated:YES afterDelay:30];
}
- (void)hideHUD{
    [MBProgressHUD hideAllHUDsForView:self animated:YES];
}

- (void)showMsg:(NSString *)msg{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self  animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = msg;
    [hud hideAnimated:YES afterDelay:1];
}
@end
