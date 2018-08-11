//
//  HJGHomeView.m
//  ChilEducation
//
//  Created by Developer on 2018/8/11.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGHomeView.h"
#import "HJGHomeCollectionViewCell.h"
#import "HJGHomeDetailController.h"
@interface HJGHomeView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

//collection
@property (nonatomic, strong) UICollectionView *collection;

@property (nonatomic, strong) NSArray *image_name_arr;

@property (nonatomic, strong) NSArray *dis_name_arr;

@end
@implementation HJGHomeView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
    
    self.image_name_arr = @[@"11",@"22",@"33.jpg",@"44.jpg",@"55",@"66",@"77.jpg",@"88",@"99",@"1010",@"1111",@"1212",@"1313",@"1414",@"1515",@"1616"];
    
    self.dis_name_arr = @[@"故事11",@"故事2323",@"故事43",@"故事4356676",@"故事7788",@"故事11",@"故事2323",@"故事43",@"故事4356676",@"故事7788",@"故事11",@"故事2323",@"故事43",@"故事4356676",@"故事7788",@"故事43",@"故事4356676"];
    
    [self backImageView];
    
    [self setTheCollect];
    
}


- (void)setTheCollect{
    
    //collection
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.sectionInset = UIEdgeInsetsMake(H(10),W(10),H(10),W(10));
    self.collection = [[UICollectionView alloc]initWithFrame:CGRectMake(W(40), kMarginTopHeight + H(40), WIDTH- W(80), HEIGHT - kMarginTopHeight - H(85) - kTabBarHeight) collectionViewLayout:layout];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    self.collection.backgroundColor = [UIColor clearColor];
    self.collection.showsVerticalScrollIndicator = NO;

    [self.collection registerClass:[HJGHomeCollectionViewCell class] forCellWithReuseIdentifier:HJGHomeC];

    [self addSubview:self.collection];
    
}


#pragma mark - collectionDelegate and dataSourse


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 16;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((WIDTH- W(10))/3.0, H(140));
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HJGHomeCollectionViewCell *cell = (HJGHomeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:HJGHomeC forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.TopIcon.image = [UIImage imageNamed:[self.image_name_arr safeObjectAtIndex:indexPath.row]];
    cell.bottomLab.text = [self.dis_name_arr safeObjectAtIndex:indexPath.row];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(H(10), W(10), H(10), W(10));
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    HJGHomeDetailController *vc = [[HJGHomeDetailController alloc]init];
    [self.vc.navigationController pushViewController:vc animated:YES];
    
}


- (UIImageView *)backImageView
{
    if (!_backImageView) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.userInteractionEnabled = YES;
        theView.image = [UIImage imageNamed:@"backHome.jpg"];
        [self addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.top.equalTo(self);
        }];
        _backImageView = theView;
    }
    return _backImageView;
}





@end
