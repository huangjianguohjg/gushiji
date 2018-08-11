//
//  HJGHomeCollectionViewCell.m
//  ChilEducation
//
//  Created by Developer on 2018/8/11.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGHomeCollectionViewCell.h"

@implementation HJGHomeCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
    
    [self TopIcon];
    
    [self bottomLab];
    
    self.backgroundColor = [UIColor clearColor];
    
    self.contentView.backgroundColor = [UIColor clearColor];
    
}


- (UIImageView *)TopIcon
{
    if (!_TopIcon) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(H(5));
            make.size.equalTo(CGSizeMake(W(80), H(80)));
        }];
        _TopIcon = theView;
    }
    return _TopIcon;
}

- (UILabel *)bottomLab
{
    if (!_bottomLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.textAlignment = NSTextAlignmentCenter;
        theView.font = [UIFont systemFontOfSize:W(16)];
        theView.textColor = [UIColor blackColor];
        theView.text = @"回到家后1";
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.TopIcon);
            make.bottom.equalTo(self.contentView).offset(-H(5));
            make.top.equalTo(self.TopIcon.bottom).offset(H(5));
        }];
        _bottomLab = theView;
    }
    
    
    return _bottomLab;
}

@end
