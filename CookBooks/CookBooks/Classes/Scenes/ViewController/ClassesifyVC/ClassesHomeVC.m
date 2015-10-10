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
#import "SmallClassesVC.h"

@interface ClassesHomeVC ()<UICollectionViewDataSource,UICollectionViewDelegate>
// 定义collectionView属性
@property (nonatomic,strong) UICollectionView *collectionView;

// 定义smallClassVC属性
@property (nonatomic,strong) SmallClassesVC *smallClassVC;


// 区头的图片
@property (nonatomic,strong) UIImage *img;

@end

@implementation ClassesHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 集合视图中每一个cell的大小
    flowLayout.itemSize = CGSizeMake(105, 30);
    // 设置每一行之间的最小间距
    flowLayout.minimumLineSpacing = 20;
    // 设置每一个item之间的最小间距
    flowLayout.minimumInteritemSpacing = 15;
    
    // 设置分区上左下右的距离, 如果不设置的话就会贴着上父视图的上下左右
    flowLayout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    _collectionView.showsVerticalScrollIndicator = NO;
    // 注册collectionView
    [self.collectionView registerClass:[ClassesCell class] forCellWithReuseIdentifier:@"cell"];
    
    // 设置数据源和代理
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    
    _collectionView.backgroundColor = [UIColor colorWithRed:0.732 green:1.000 blue:0.782 alpha:1.000];
    // 注册头
    [self.collectionView registerNib:[UINib nibWithNibName:@"ClassesHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    // 区头尺寸
    flowLayout.headerReferenceSize = CGSizeMake(375, 40);
    
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
    ClassesifyModel *model = [[ClassesifyHelpers classesifyShare] mutArray][section];
    return model.listArr.count;
}

// 返回Item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ClassesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    ClassesifyModel *model = [[ClassesifyHelpers classesifyShare] mutArray][indexPath.section];
    cell.dishName.text = model.listArr[indexPath.row][@"name"];
    cell.backgroundColor = [UIColor whiteColor];
    cell.dishName.font = [UIFont systemFontOfSize:15];
    // 给cell设置圆角
    cell.layer.cornerRadius = 5;
    cell.layer.masksToBounds = YES;
    
    
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
    // 属性传值(接口拼接)
    [SmallClassesifyHelpers smallClassesifyShare].urlID = model.listArr[indexPath.row][@"typeid"];
    
    //    if ([model.listArr[indexPath.row][@"typeid"] isEqualToString:model.listArr[indexPath.row][@"ord"]]) {
    // 指向子控制器
    _smallClassVC = [[SmallClassesVC alloc] init];
    _smallClassVC.view.center = self.view.center;
    // 添加子视图控制器
    [self addChildViewController:_smallClassVC];
    // 添加子视图
    [self.view addSubview:_smallClassVC.view];
    
    //    }
    //    else if (![[NSString stringWithFormat:@"%ld",(long)model.ord] isEqualToString: [NSString stringWithFormat:@"%@",model.typeID]])
    //    {
    //    DetailsListVC *detailVC = [DetailsListVC new];
    //    [self presentViewController:detailVC animated:NO completion:nil];
    //    
    //    }
    
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
