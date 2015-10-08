//
//  HealthHomeVC.m
//  Cookbook
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HealthHomeVC.h"
#import "HealthHomeHelper.h"
#import "HealthHomeCell.h"
#import "UIImageView+WebCache.h"
#import "HealthHomeModel.h"
#import "HealthListVC.h"

//主页接口网址
#define HealthHomeURL @"http://iapi.ipadown.com/api/yangshen/left.category.api.php?siteid=8&catename=%E9%A5%AE%E9%A3%9F%E5%85%BB%E7%94%9F&type=1"


@interface HealthHomeVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;



@end

@implementation HealthHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建collectionView
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    
    //设置代理
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"HealthHomeCell" bundle:nil] forCellReuseIdentifier:@"HealthHomeCell"];
    
    
    
    //添加视图
    [self.view addSubview:self.tableView];
    
    //解析数据
    [[HealthHomeHelper shareHelper] fetchDataWithUrl:HealthHomeURL Block:^(NSMutableDictionary *healthModelDict) {
        //传值
        self.healthHomeDict = [healthModelDict copy];
        //刷新界面
        [self.tableView reloadData];
        NSLog(@"ndhdn");
    }];
    
    
    
}

#pragma mark --UICollectionViewDataSource
//cell的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //分区所对应的所有cell
    NSArray *arr = self.healthHomeDict[[self.healthHomeDict  allKeys][section]];
    return arr.count;
}

//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HealthHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HealthHomeCell" forIndexPath:indexPath];
    
    //此数据对应得key值
    NSString *key = [self.healthHomeDict allKeys][indexPath.section];
    //将存放model数据赋给对象
    HealthHomeModel *model = self.healthHomeDict[key][indexPath.row];
    
    //赋值
    cell.healthHomeLabel.text = model.title;
    cell.healthHomeLabel.font = [UIFont systemFontOfSize:15];
   
    return cell;
}

//分区的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [self.healthHomeDict allKeys].count;
}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
//区头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [self.healthHomeDict allKeys][section];
}

//选中cell点击事件

- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    HealthListVC *listVC = [HealthListVC new];
    //取到当前点击的cell的key值
    NSString *key = [self.healthHomeDict allKeys][indexPath.section];
    //取到当前点击的cell的model
    HealthHomeModel *model = self.healthHomeDict[key][indexPath.row];
    listVC.urlStr = model.apiurl;
    //跳转页面
    [self.navigationController pushViewController:listVC animated:YES];
    
}



#pragma mark --lazyload

- (NSDictionary *)healthHomeDict{
    if (_healthHomeDict == nil) {
        _healthHomeDict = [NSDictionary dictionary];
    }
    return _healthHomeDict;
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