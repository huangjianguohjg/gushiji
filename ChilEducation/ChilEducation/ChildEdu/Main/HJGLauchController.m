//
//  HJGLauchController.m
//  ChilEducation
//
//  Created by Developer on 2018/8/11.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGLauchController.h"
#import "HJGHomePageController.h"

@interface HJGLauchController ()

@end

@implementation HJGLauchController

- (void)viewDidLoad {
    [super viewDidLoad];

    [SVProgressHUD showWithStatus:@"正在载入..."];
    
    
    [self lauch];
}

- (void)lauch{
    
    
    // 设置初始导航栏透明度
    [self wr_setNavBarBackgroundAlpha:0];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [SVProgressHUD dismiss];
        
        HJGHomePageController *vc = [[HJGHomePageController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    });
    
    
}


@end
