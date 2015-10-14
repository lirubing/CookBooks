//
//  HomeView.m
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeView.h"
#import "SDCycleScrollView.h"
#import "HomeTableCell.h"
#import "HomeHelper.h"
#import "UIImageView+WebCache.h"
#import "HomeModel.h"
#import "HomeListVC.h"
#import "HomeWebVC.h"

@interface HomeView()<SDCycleScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

//详情页的控制器
@property (nonatomic, strong) ARSegmentPageController *pager;

@property (nonatomic,strong) UIImage * blurImage;

@property (nonatomic,strong) UIImage * defaultImage;
@property (nonatomic,strong) HomeDetaDoing *one;
@property (nonatomic,strong) HomeDetaMaterial *two;
@property (nonatomic,strong) HomeDetaKnowledge *three;
@property (nonatomic,strong) HomeDetaRelation *four;

@end

@implementation HomeView

//绘制整个tableView的区头
- (void)drawMyTableHeader{
    
    //解析数据
    [[HomeHelper shareHomeHelper] requestWithHomeFinish:^{
        
        [self drawScrollImage];
        [self drawImage];
        [self drawSetImage];
        [self reloadInputViews];
    }];
    
    
    
}

#pragma mark ------------HomeDeatVC----------
//详情页的控制器
- (void)getHomeDetaVC{
    
    self.blurImage = [UIImage imageNamed:@"终极版"];
    self.defaultImage = [UIImage imageNamed:@"终极版"];
    
    self.one = [HomeDetaDoing new];
    self.two = [HomeDetaMaterial new];
    self.three = [[HomeDetaKnowledge alloc]initWithStyle:UITableViewStyleGrouped];
    self.four = [[HomeDetaRelation alloc]initWithStyle:UITableViewStyleGrouped];
    
    ARSegmentPageController *pager = [ARSegmentPageController new];
    pager.headerHeight = 180;
    [pager setViewControllers:@[self.one,self.two,self.three,self.four]];
    
    self.pager = pager;
}

//关于详情页区头图片效果的设置
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    CGFloat topInset = [change[NSKeyValueChangeNewKey] floatValue];
    
    if (topInset <= self.pager.segmentMiniTopInset) {
        self.pager.title = nil;
        self.pager.headerView.imageView.image = self.blurImage;
    }else{
        self.pager.title = nil;
        self.pager.headerView.imageView.image = self.defaultImage;
    }
}



//绘制第一部分
- (void)drawImage{
    
    HomeModel *model = [HomeModel new];
    HomeModel *model1 = [HomeModel new];

    model = [HomeHelper shareHomeHelper].arrayHot.firstObject;
    model1 = [HomeHelper shareHomeHelper].arrayHot.lastObject;

    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(9, 8, 200, 30)];
    label.text = @"热门推荐";
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
    
    
    UIImageView *imag1 = [[UIImageView alloc]initWithFrame:CGRectMake(9, 40, 163, 105)];
    [imag1 sd_setImageWithURL:[NSURL URLWithString:model.image]];
    //轻拍手势
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction1)];
    //将手势添加到视图上
    [imag1 addGestureRecognizer:tap1];
    imag1.backgroundColor = [UIColor cyanColor];
    imag1.userInteractionEnabled = YES;
    [self.view addSubview:imag1];
 
    
    UIImageView *imag2 = [[UIImageView alloc]initWithFrame:CGRectMake(201, 40, 163, 105)];
    [imag2 sd_setImageWithURL:[NSURL URLWithString:model1.image]];
    //轻拍手势
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction2)];
    //将手势添加到视图上
    [imag2 addGestureRecognizer:tap2];
    imag2.backgroundColor = [UIColor blueColor];
    imag2.userInteractionEnabled = YES;
    [self.view addSubview:imag2];
 
}
//点击事件
- (void)tapAction1{
    [self getHomeDetaVC];
    HomeModel *model = [HomeModel new];
    model = [HomeHelper shareHomeHelper].arrayHot.firstObject;
    self.one.ID = [model.id_home integerValue];
    self.two.ID = [model.id_home integerValue];
    self.three.ID = [model.id_home integerValue];
    self.four.ID = [model.id_home integerValue];
    
    self.pager.navigationItem.title = model.title;
    [self.navigationController pushViewController:self.pager animated:YES];
    
}
//点击事件
- (void)tapAction2{
    HomeModel *model = [HomeModel new];
    model = [HomeHelper shareHomeHelper].arrayHot.lastObject;
    self.one.ID = [model.id_home integerValue];
    self.two.ID = [model.id_home integerValue];
    self.three.ID = [model.id_home integerValue];
    self.four.ID = [model.id_home integerValue];
    
    self.pager.navigationItem.title = model.title;
    [self.navigationController pushViewController:self.pager animated:YES];
    
}



//绘制轮播图
- (void)drawScrollImage{
    
  
    NSMutableArray *mutArrayIM = [NSMutableArray array];
    
    for (int i = 0; i < [HomeHelper shareHomeHelper].arrayImg.count; i++) {
        HomeModel *model = [HomeHelper shareHomeHelper].arrayImg[i];
        [mutArrayIM addObject:model.image];
    }
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(9, 158, 356, 132) imageURLStringsGroup:nil];

    
    //pageControl 图标居右侧
   cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.dotColor = [UIColor orangeColor];

    //设置代理  实现轮播图的点击方法
    cycleScrollView.delegate = self;
    
    //设置轮播图数组
    cycleScrollView.imageURLStringsGroup = [mutArrayIM mutableCopy];

    
    [self.view addSubview:cycleScrollView];
    
}


#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    HomeModel *model = [HomeHelper shareHomeHelper].arrayImg[index];
    HomeWebVC *webVC = [HomeWebVC new];
    webVC.webString = model.link;
    NSLog(@"====%@",webVC.webString);
    [self.navigationController pushViewController:webVC animated:YES];

}



//绘制集合视图
- (void)drawSetImage{
    //布局实例对象
    UICollectionViewFlowLayout *flowLayout1 = [UICollectionViewFlowLayout new];
    flowLayout1.itemSize = CGSizeMake(60, 60);
    flowLayout1.minimumInteritemSpacing = 10;
    flowLayout1.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    //设置集合视图
    UICollectionView *collectionView1 = [[UICollectionView alloc]initWithFrame:CGRectMake(9, 289, 356, 80) collectionViewLayout:flowLayout1];
    collectionView1.backgroundColor = [UIColor whiteColor];
    collectionView1.delegate = self;
    collectionView1.dataSource = self;
    [self.view addSubview:collectionView1];
    //集合视图注册
    [collectionView1 registerNib:[UINib nibWithNibName:@"HomeTableCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
   
    
}

//返回item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

//返回分区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//返回item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //注册
    HomeTableCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    HomeModel *model = [HomeHelper shareHomeHelper].arraySet[indexPath.row];
    cell.model = model;
    
    return cell;
}

//item点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeModel *model = [HomeModel new];
    model = [HomeHelper shareHomeHelper].arraySet[indexPath.row];
    HomeListVC *vc = [HomeListVC new];
    vc.ID = model.id_home;
    vc.textName = model.text;
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
