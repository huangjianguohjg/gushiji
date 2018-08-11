//
//  HJGHomeDetailController.m
//  ChilEducation
//
//  Created by Developer on 2018/8/11.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGHomeDetailController.h"
#import "YSSpeech.h"

@interface HJGHomeDetailController (){
    CGFloat            _voice;
    CGFloat            _rate;
}

@property (nonatomic, strong) UIImageView *backImageView;

@property (nonatomic, strong) NSArray *image_arr;

@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) UIButton *startBut;

@property (nonatomic, strong) UIButton *reNewBut;

@property (strong, nonatomic) YSSpeech *speech;

@property (nonatomic, strong) UIButton *closeBut;

@end

@implementation HJGHomeDetailController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置初始导航栏透明度
    [self wr_setNavBarBackgroundAlpha:0];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[UIView new]];
    
    self.navigationItem.title = self.title_str;
    
    [self configBaseData];
    
    self.image_arr = @[@"b1",@"b2",@"b3",@"b4",@"b5",@"b6"];
    
    [self backImageView];
    
    [self textView];
    
    [self startBut];
    
    [self reNewBut];
    
    [self closeBut];
    
}

- (void)configBaseData{
    
    _speech = [[YSSpeech alloc]init];
    _speech.repeatCount = 3;
    

    
}


- (UIImageView *)backImageView
{
    if (!_backImageView) {
        int y =(arc4random() % 6);
        
        DLog(@"-----------------%d",y);
        UIImageView * theView = [[UIImageView alloc] init];
        theView.backgroundColor = [UIColor redColor];
        theView.image = [UIImage imageNamed:[self.image_arr safeObjectAtIndex:y]];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.equalTo(self.view);
        }];
        _backImageView = theView;
    }
    return _backImageView;
}

- (UITextView *)textView
{
    if (!_textView) {
        UITextView * theView = [[UITextView alloc] init];
        theView.text  = self.gushi;
        theView.textColor = [UIColor blackColor];
        theView.font = [UIFont systemFontOfSize:W(25)];
        theView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:theView];
        [theView setEditable:NO];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(kMarginTopHeight + H(15));
            make.left.equalTo(self.view).offset(W(25));
            make.right.equalTo(self.view).offset(-W(25));
            make.bottom.equalTo(self.view).offset(-H(100));
        }];
        _textView = theView;
    }
    return _textView;
}

- (UIButton *)startBut
{
    if (!_startBut) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setImage:[UIImage imageNamed:@"start1"] forState:0];
        [theView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [theView addTarget:self action:@selector(startButClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(W(20));
            make.bottom.equalTo(self.view).offset(-H(20));
            make.size.equalTo(CGSizeMake(W(80), H(80)));
        }];
        _startBut = theView;
    }
    return _startBut;
}




- (UIButton *)reNewBut
{
    if (!_reNewBut) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setTitle:@"重新开始" forState:0];
        [theView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [theView addTarget:self action:@selector(reNewButClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view).offset(-W(20));
            make.bottom.equalTo(self.view).offset(-H(20));
            make.size.equalTo(CGSizeMake(W(70), H(30)));
        }];
        _reNewBut = theView;
    }
    return _reNewBut;
}

- (void)startButClick:(UIButton *)but{
    
    but.selected = !but.selected;
    
    if (but.selected) {
        [but setImage:[UIImage imageNamed:@"stop1"] forState:0];
        
        _speech.speakWords = self.textView.text;
        [_speech startSpeaking];
    }else{
        
        [but setImage:[UIImage imageNamed:@"start1"] forState:0];
        
        [_speech stopSpeaking];
    }
    
}

- (void)reNewButClick:(UIButton *)but{
    
    
    
}

- (UIButton *)closeBut
{
    if (!_closeBut) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setImage:[UIImage imageNamed:@"close1"] forState:UIControlStateNormal];
        [theView addTarget:self action:@selector(closeButClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-H(15));
            make.size.equalTo(CGSizeMake(W(80), H(80)));
        }];
        _closeBut = theView;
    }
    return _closeBut;
}

- (void)closeButClick{
    
    [self.speech stopSpeaking];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
//    [self.textView scrollsToTop];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.textView scrollsToTop];
    });
    
}

@end
