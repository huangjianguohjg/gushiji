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

@property (strong, nonatomic)YSSpeech *speech;

@end

@implementation HJGHomeDetailController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置初始导航栏透明度
    [self wr_setNavBarBackgroundAlpha:0];
    
    [self configBaseData];
    
    self.image_arr = @[@"b1",@"b2",@"b3",@"b4",@"b5",@"b6"];
    
    [self backImageView];
    
    [self textView];
    
    [self startBut];
    
    [self reNewBut];
    
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
        theView.text  = @"还得改回访客户较为广泛嘉禾望岗黄建国钢结构好几个价格国际化个感觉钢结构和环境给禁锢于关于个就感觉就换个环境环境规划规划局国际化钴铬合金国际化国际化规划局规划感觉更国际化规划局很干净国际化国际化规划局规划局规划局更换规划局规划局孤鸿寡鹄规划局几个号共和国环境吧黑科技开奖黑科技就会好久好久开奖空间环境就会建行卡扣扣号进口红酒尽快尽快见客户即可将很快黑胡椒康复医院1一样过一个月用个鬼一样否否费用吩咐付付费用富裕抚养费用方法与富有吩咐发附庸风雅方法与副反应复用付费发否否夫妇収";
        theView.textColor = [UIColor blackColor];
        theView.font = [UIFont systemFontOfSize:W(25)];
        theView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:theView];
        [theView setEditable:NO];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.view).offset(H(20));
            make.width.equalTo(WIDTH - W(55));
            make.height.equalTo(HEIGHT - H(190));
        }];
        _textView = theView;
    }
    return _textView;
}

- (UIButton *)startBut
{
    if (!_startBut) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setTitle:@"开始" forState:0];
        [theView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [theView addTarget:self action:@selector(startButClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(W(20));
            make.bottom.equalTo(self.view).offset(-H(20));
            make.size.equalTo(CGSizeMake(W(70), H(30)));
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
        [but setTitle:@"暂停" forState:0];
        
        _speech.speakWords = self.textView.text;
        [_speech startSpeaking];
    }else{
        
        [but setTitle:@"开始" forState:0];
        
        [_speech pauseSpeaking];
    }
    
}

- (void)reNewButClick:(UIButton *)but{
    
    
    
}

@end
