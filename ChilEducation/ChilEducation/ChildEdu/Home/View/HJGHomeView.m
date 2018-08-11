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

@property (nonatomic, strong) NSArray *gushi_arr;

@end
@implementation HJGHomeView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
    

    [self loadGushi];
    
    self.image_name_arr = @[@"11",@"22",@"33.jpg",@"44.jpg",@"55",@"66",@"77.jpg",@"88",@"99",@"1010",@"1111",@"1212",@"1313",@"1414",@"1515",@"1616"];
    
    self.dis_name_arr = @[@"毛驴王子的故事",@"故事2323",@"故事43",@"故事4356676",@"故事7788",@"故事11",@"故事2323",@"故事43",@"故事4356676",@"故事7788",@"故事11",@"故事2323",@"故事43",@"故事4356676",@"故事7788",@"故事43",@"故事4356676"];
    
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
    vc.gushi = [self.gushi_arr safeObjectAtIndex:indexPath.row];
    vc.title_str = [self.dis_name_arr safeObjectAtIndex:indexPath.row];
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

- (void)loadGushi{

    NSString *one = @"    从前，有个国王和王后，他们很富有，简直享有一切他们所希望的东西，只是没有孩子。王后为此日夜伤感，说：“我就像块不长庄稼的地。”上帝最后成全了他，给他了个孩子，但这孩子根本不像人，而是头小毛驴。母亲不见则已见了叫苦连天，她说自己宁可不要孩子也不愿有头驴，并且还想把他扔进河里让鱼吃掉。但国王却说：“别这样，既然上帝把他赐给我们，他就该是我的儿子和继续人，在我死后戴上王冠坐上皇帝的宝座。”就这样，这驴子被养了下来，慢慢长大了，它的耳朵又细又长，向上直伸着。\n    驴儿天性活泼，到处跳跃、游戏，且非凡爱好音乐。于是他走到一位有名的乐师那里，说“把你的本领教给我吧，我要把琴弹得和你一样好。”“啊，小少爷，”乐师说，“这对你来说就难了，你的手指实在太粗，不是块弹琴的料。我怕琴弦经不起。”但他的推脱没用，驴儿要弹琴，非学弹琴不可。他学起来又勤快、又刻苦，最后练得竟和师傅一样好了。\n　　有一次，这小主人出去散步，脑子正在思考着什么，不觉来到了一口井边。他往水中一瞧，见水面清亮如镜，那儿有自己的驴子模样。他懊丧极了，便带了忠实的仆人离家出走，到了很远的地方。他们四处漂泊，最后来到了一个王国，统治这个国家的是位年迈的国王，不过他有一位漂亮绝伦的独身女。驴儿说：“我们就在这儿呆下吧!”说着就去敲城门，“外边有客，快开门让他进来!”有人说但是大门没有打开。他于是坐了下来，取出他的琴，伸出两只前腿弹起琴来，音乐非常美丽动听。守城门的人听得睁大了眼，赶忙跑去报告国王：“门外坐着头驴子，琴儿弹得有大师那么棒。”“让那位音乐家到我这儿来吧!”国王说。\n　　当那驴儿一进来，所有的人都称赞起这位弹琴的来，他们让他坐下来和仆人一块儿吃饭，他却很不乐意，说：“我可不是头普通的驴子，我可是位贵族。”他们说：“假如你真是位贵族，就和武士们坐一起吧。”“不，我要坐在国王身旁。”国王微微一笑，很幽默地说：“好吧，就照你的意思办。小毛驴，到我这儿来吧。”然后他又问：“小毛驴，你觉得我女儿怎么样?”驴儿转过头看着她，点了点头，说“实在太美了!我还没见过像她这样漂亮的女孩。”“那么，好吧，你也该挨着她坐吧!”国王说。“那我是求之不得的呢!”驴儿一边说，一边紧挨着公主坐下。他又吃又喝，既举止优雅，又注重清洁卫生。\n　　这高贵的驴儿在宫里住了一些时，他想：“这一切对我有何用呢?我得回家去。”于是他便难过地垂下了头，来到国王跟前，请求能让他走。但国王已经喜欢上他了，便说：“小毛驴，你什么事儿不开心?你看起来就像一缸醋一样酸溜溜的。你要什么我就给你什么，你要金子吗?”“不，”驴儿摇头说。“你要珠宝和华贵的服装吗?”“不。”“我分给你半个王国，好吗?”“啊呀，不。”于是，国王说：“什么能教你开心，你是不是想娶我的宝贝女儿做妻子?”“啊，是的是的。”他一下子变得兴奋起来，那确实是他所希望的。【儿童睡前故事：www.qigushi.com】\n　　于是他们举行了隆重而豪华的婚礼。新婚之夜，新郎和新娘被带进了洞房，国王想知道驴儿是不是举止温文尔雅，便命一个仆人躲在那里。他们双双走进了新房，新郎闩上了门，他以为只有他们俩在那里，只见他摔脱了身上的皮，站在那儿，竟是个英俊潇洒的青年。“现在你瞧我是谁，看我配不配得上你。”这时新娘非常兴奋，过来吻他，打心眼里爱着他。到了早上，他跳了起来，又重新披上驴皮，没有人会想得到里面藏着个多么英俊的帅小伙子。不久老国王来了，“啊，”他叫道，“驴儿已经起床了!女儿呀，你一定很伤心，没能嫁一个能真正作你丈夫的人。”“哦，不，亲爱的父亲，我很爱他，他就像是世上最英俊潇洒的小伙子，我会终生和他厮守在一起的。”国王感到很惊奇。但是先前藏在新房的仆人来了，向国王透露了一切。\n　　国王说：“这绝不可能是真的!”“那么今晚就请您亲自去看看，你会亲眼看见的。国王，你听我说，你去把他的皮拿走，把它扔进火里烧掉，到时他就会显露真形的。”国王说：“你这主意很不错。”到了晚上他们睡觉时，他偷偷地走了进去，来到床前，借助月光他看见了一个相貌堂堂的年轻人躺在床上，那件驴皮就放在地上。于是他把驴皮拿走了，让人在外面生起火，然后把驴皮扔了进去，等着看到它化为了灰烬。\n国王急于想看看这位丢了东西的新郎会怎样，便彻夜没睡，一直关注着。年轻人睡醒后，就着晨光一翻而起，想穿上那张驴皮，但没找着。这下他变得很惊恐焦虑，又非常伤心，说：“现在我非逃走不可了。”，但他刚走出来，但便发现国王正站在那儿。国王说：“我的儿，你这么匆匆忙忙上哪去?你心里有啥事?留在这里吧，你是个这样潇洒的小伙子，你是不会离开我的。我现在就把我的一半王国给你，等我死后，整个王国都归你。”“我也希望善始善终，那我就留在这儿吧!”\n随后老国王给了他一半的国土，一年后国王死了，整个王国都属于了他。他自己的父亲死后，他又得到了另一个王国，从此便过着荣华富贵的生活。";
    self.gushi_arr = @[one,one,one,one,one,one,one,one,one,one,one,one,one,one,one,one,one,one,one,one,one,one,one,one,one,one,one,one];
}



@end
