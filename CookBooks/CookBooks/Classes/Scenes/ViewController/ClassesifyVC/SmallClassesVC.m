//
//  SmallClassesVC.m
//  CookBooks
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "SmallClassesVC.h"
#import "SmallClassesCell.h"
#import "SmallClassesifyModel.h"
#import "SmallClassesifyHelpers.h"
#import "ClassesHomeVC.h"
#import "DetailsListVC.h"
#import "SmallHeaderCell.h"
#import <AFNetworking.h>

@interface SmallClassesVC ()<UICollectionViewDataSource,UICollectionViewDelegate>
// 结合视图属性
@property (nonatomic,strong) UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)NSMutableArray *array;

@end

@implementation SmallClassesVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor clearColor];
    
    [self drawJumpView];
    // 注册smallCollectionView
    [self.smallCollectionView registerClass:[SmallClassesCell class] forCellWithReuseIdentifier:@"smallCell"];
    // 设置数据源和代理
    self.smallCollectionView.dataSource = self;
    self.smallCollectionView.delegate = self;
    
    // 传值
    [[SmallClassesifyHelpers smallClassesifyShare] getSmallClassesUrl:^{
        self.array = [SmallClassesifyHelpers smallClassesifyShare].mutArr;
        [self.smallCollectionView reloadData];
    }];
    
    // 区头尺寸
    _layout.headerReferenceSize = CGSizeMake(300, 30);
    // 注册区头
    [self.smallCollectionView registerNib:[UINib nibWithNibName:@"SmallHeaderCell" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    
}

// 绘制跳转页面jumpView
- (void)drawJumpView
{
    // 分类视图
    UIView *smallView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 260)];
    smallView.layer.cornerRadius = 6;
    smallView.layer.masksToBounds = YES;
   // 添加collectionView
    _layout = [[UICollectionViewFlowLayout alloc] init];
    _smallCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 300, 260) collectionViewLayout:_layout];
    // 每个cell的大小
    _layout.itemSize = CGSizeMake(80, 30);
    _layout.minimumInteritemSpacing = 15;
  
    // 设置分区上左下右距离
    _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    _smallCollectionView.backgroundColor = [UIColor colorWithRed:0.569 green:0.637 blue:0.680 alpha:1.000];
    [self.view addSubview:smallView];
    [smallView addSubview:_smallCollectionView];
    smallView.center = self.view.center;
    _smallCollectionView.showsVerticalScrollIndicator = NO;
    
    
}

// 返回区头
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    SmallHeaderCell *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    
    // 解决<__NSArrayM: 0xb550c30>
    NSMutableArray *a = self.array;
    NSArray *arr = [NSArray arrayWithArray:a];
    for (SmallClassesifyModel *s in arr) {
        header.header.text = s.typeName;
    }
    return header;
   
}

// 点击方法
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 从父视图上移除
    [self removeFromParentViewController];
    [self.view removeFromSuperview];

}

// 返回Item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[[SmallClassesifyHelpers smallClassesifyShare] mutArr] count];
}

// 返回Item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SmallClassesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"smallCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    SmallClassesifyModel *model = [[SmallClassesifyHelpers smallClassesifyShare] mutArr][indexPath.row];
    // 给cell设置圆角
    cell.layer.cornerRadius = 3;
    cell.layer.masksToBounds = YES;

    [cell setSmallModel:model];


    return cell;
}

// 选中item事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsListVC *detailsVC = [DetailsListVC new];
    // 跳转页面动画
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.3];
    [animation setType: kCATransitionMoveIn];
    [animation setSubtype: kCATransitionFromTop];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    
    [self.navigationController pushViewController:detailsVC animated:NO];
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    // 属性传值(拼接)
    SmallClassesifyModel *model = [[SmallClassesifyHelpers smallClassesifyShare] mutArr][indexPath.row];
    detailsVC.idUrl = model.tagid;
    detailsVC.navigationItem.title = model.typeName;
    // 从父视图上移除
    [self removeFromParentViewController];
    [self.view removeFromSuperview];
    
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
-(NSMutableArray *)array
{

    if (_array ==nil) {
        _array = [NSMutableArray new];
    }
    return _array;
}
@end
