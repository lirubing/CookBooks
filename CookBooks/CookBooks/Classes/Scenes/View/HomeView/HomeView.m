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

@interface HomeView()<SDCycleScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>


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

//绘制第一部分
- (void)drawImage{
    
    HomeModel *model = [HomeModel new];
    HomeModel *model1 = [HomeModel new];

    model = [HomeHelper shareHomeHelper].arrayHot.firstObject;
    model1 = [HomeHelper shareHomeHelper].arrayHot.lastObject;

    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(9, 8, 200, 30)];
    label.text = @"热门推荐";
    label.textColor = [UIColor redColor];
    [self addSubview:label];
    
    
    UIImageView *imag1 = [[UIImageView alloc]initWithFrame:CGRectMake(9, 40, 163, 105)];
    [imag1 sd_setImageWithURL:[NSURL URLWithString:model.image]];
    imag1.backgroundColor = [UIColor cyanColor];
    imag1.userInteractionEnabled = YES;
    [self addSubview:imag1];
 
    
    UIImageView *imag2 = [[UIImageView alloc]initWithFrame:CGRectMake(201, 40, 163, 105)];
    [imag2 sd_setImageWithURL:[NSURL URLWithString:model1.image]];
    imag2.backgroundColor = [UIColor blueColor];
    imag2.userInteractionEnabled = YES;
    [self addSubview:imag2];
 
}


//绘制轮播图
- (void)drawScrollImage{
    
  
    NSMutableArray *mutArrayIM = [NSMutableArray array];
    
    for (int i = 0; i < [HomeHelper shareHomeHelper].arrayImg.count; i++) {
        [mutArrayIM addObject:[HomeHelper shareHomeHelper].arrayImg[i]];
    }
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(9, 158, 356, 132) imageURLStringsGroup:nil];

    
    //pageControl 图标居右侧
   cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.dotColor = [UIColor orangeColor];

    //设置代理  实现轮播图的点击方法
    cycleScrollView.delegate = self;
    
    //设置轮播图数组
    cycleScrollView.imageURLStringsGroup = [mutArrayIM mutableCopy];

    
    [self addSubview:cycleScrollView];
    
}


#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", index);
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
    [self addSubview:collectionView1];
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



@end
