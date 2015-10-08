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

@interface HomeView()<SDCycleScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>


@end

@implementation HomeView

//绘制整个tableView的区头
- (void)drawMyTableHeader{
    
    [self drawImage];
    [self drawScrollImage];
    [self drawSetImage];
}

//绘制第一部分
- (void)drawImage{
    UIImageView *imag1 = [[UIImageView alloc]initWithFrame:CGRectMake(23, 20, 149, 96)];
    imag1.backgroundColor = [UIColor cyanColor];
    imag1.userInteractionEnabled = YES;
    imag1.image = [UIImage imageNamed:@"小主页"];
    [self addSubview:imag1];
    
    UIImageView *imag2 = [[UIImageView alloc]initWithFrame:CGRectMake(205, 20, 149, 96)];
    imag2.backgroundColor = [UIColor blueColor];
    imag2.userInteractionEnabled = YES;
    imag2.image = [UIImage imageNamed:@"小分类"];
    [self addSubview:imag2];
    
}


//绘制轮播图
- (void)drawScrollImage{

    NSArray *array = @[[UIImage imageNamed:@"小主页"],
                       [UIImage imageNamed:@"小分类"],
                       [UIImage imageNamed:@"小营养"],
                       [UIImage imageNamed:@"小我的"]
                       ];;
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(9, 138, 356, 132) imagesGroup:array];
    cycleScrollView.backgroundColor = [UIColor greenColor];
    
    [self addSubview:cycleScrollView];
    //设置代理  实现轮播图的点击方法
    cycleScrollView.delegate = self;
    
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
    flowLayout1.itemSize = CGSizeMake(70, 70);
    flowLayout1.minimumInteritemSpacing = 10;
    flowLayout1.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    //设置集合视图
    UICollectionView *collectionView1 = [[UICollectionView alloc]initWithFrame:CGRectMake(9, 279, 356, 95) collectionViewLayout:flowLayout1];
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
    HomeTableCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.setImage.backgroundColor = [UIColor redColor];
    cell.setLable.text = @"测试";
    cell.setLable.textColor = [UIColor blueColor];
    return cell;
}



@end
