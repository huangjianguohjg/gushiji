//
//  HJGHomePageController.m
//  ChilEducation
//
//  Created by Developer on 2018/8/11.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGHomePageController.h"
#import "HJGHomeView.h"
#import "HJGHomeDetailController.h"

@interface HJGHomePageController ()

@property (nonatomic, strong) HJGHomeView *homeView;

@end

@implementation HJGHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[UIView new]];
    
    [self configNav];
    
    [self configView];

    // 设置初始导航栏透明度
    [self wr_setNavBarBackgroundAlpha:0];
    
}


- (HJGHomeView *)homeView
{
    if (!_homeView) {
        HJGHomeView * theView = [[HJGHomeView alloc] init];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.equalTo(self.view);
        }];
        _homeView = theView;
    }
    return _homeView;
}

#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"兔兔故事机";
    
}

#pragma mark - configView
- (void)configView{
    
    [self homeView];
    
    self.homeView.vc = self;
    
}



@end
