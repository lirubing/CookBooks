//
//  ClassesHomeVC.m
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "ClassesHomeVC.h"
#import "ClassesifyModel.h"
#import "ClassesifyHelpers.h"
#import "ClassesCell.h"
#import "SmallClassesifyHelpers.h"
#import "SmallClassesCell.h"
#import "SmallClassesifyModel.h"
#import "ClassesHeaderView.h"

@interface ClassesHomeVC ()<UICollectionViewDataSource,UICollectionViewDelegate>
// 定义collectionView属性
@property (nonatomic,strong) UICollectionView *collectionView;



// 区头的图片
@property (nonatomic,strong) UIImage *img;
// 点击collectionView弹出的视图
@property (nonatomic,strong) UIView *jumpView;

@end

@implementation ClassesHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 集合视图中每一个cell的大小
    flowLayout.itemSize = CGSizeMake(50, 30);
    // 设置每一行之间的最小间距
    flowLayout.minimumLineSpacing = 20;
    // 设置每一个item之间的最小间距
    flowLayout.minimumInteritemSpacing = 20;
    // 区头尺寸
    flowLayout.headerReferenceSize = CGSizeMake(375, 40);
    
    // 设置分区上左下右的距离, 如果不设置的话就会贴着上父视图的上下左右
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 30, 20, 30);
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    _collectionView.showsVerticalScrollIndicator = NO;
    // 注册collectionView
    [self.collectionView registerClass:[ClassesCell class] forCellWithReuseIdentifier:@"cell"];
    
    // 设置数据源和代理
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    // 注册头
    [self.collectionView registerNib:[UINib nibWithNibName:@"ClassesHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    // 添加到视图上
    [self.view addSubview:self.collectionView];
    
    
    
    
    // 传值
    [[ClassesifyHelpers classesifyShare] getUrl:^{
        [self.collectionView reloadData];
    }];

    
}

#pragma mark - UICollectionViewDelegate and datasource
// 返回分区的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [[ClassesifyHelpers classesifyShare] mutArray].count;
}

// 返回Item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    ClassesifyModel *model=[[ClassesifyHelpers classesifyShare] mutArray][section];
    return model.listArr.count;
}

// 返回Item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
 
    ClassesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    ClassesifyModel *model = [[ClassesifyHelpers classesifyShare] mutArray][indexPath.section];
    cell.dishName.text = model.listArr[indexPath.row][@"name"];
    cell.backgroundColor = [UIColor colorWithRed:1.000 green:0.879 blue:0.991 alpha:1.000];
    cell.dishName.font = [UIFont systemFontOfSize:15];
    
    
    
    return cell;
}

// 返回区头
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    ClassesHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    ClassesifyModel *model = [[ClassesifyHelpers classesifyShare] mutArray][indexPath.section];
    header.header.text = model.name;
  
    // 分类的图片
    NSString *imgName = [NSString stringWithFormat:@"%ld",(long)indexPath.section + 1];
    _img = [UIImage imageNamed:imgName];
    
    header.headerImg.image = _img;

    
    return header;
 }

// 每一个item的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ClassesifyModel *model = [[ClassesifyHelpers classesifyShare] mutArray][indexPath.section];
    
    [SmallClassesifyHelpers smallClassesifyShare].urlID = model.listArr[indexPath.row][@"typeid"];
    
    [[SmallClassesifyHelpers smallClassesifyShare] getSmallClassesUrl:^{
        [self.collectionView reloadData];
    }];
    
    
    

    NSLog(@"%ld--%ld",indexPath.section,indexPath.row);

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
