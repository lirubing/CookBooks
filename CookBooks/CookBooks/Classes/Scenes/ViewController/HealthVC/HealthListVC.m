//
//  HealthListVC.m
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HealthListVC.h"
#import "HealthListHelper.h"
#import "HealthListerModel.h"
#import "HealthListCell.h"
#import "UIImageView+WebCache.h"
#import "HealthHomeVC.h"
#import "HealthDetailVC.h"
#import "MJRefresh.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface HealthListVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;
//当前页
@property (nonatomic, assign)NSInteger currentPage;



@end

@implementation HealthListVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    

    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView setContentOffset:CGPointMake(0,0) animated:NO];
       
    //设置当前页为第一页
    self.currentPage = 1;
    
    
    //下拉刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
     
        [[HealthListHelper new] fetchDataWithUrl:self.urlStr Block:^(NSMutableArray *arr) {
            self.healthListeArr = arr;
            [self.tableView reloadData];
            //数据加载完成后，停止刷新
            [self.tableView.header endRefreshing];
        } refreshBlockPageSize:^(NSNumber *pageSize) {
            self.refreshUrlStrPageSize = pageSize;
        } refreshBlockTotalPage:^(NSNumber *totalPage) {
            self.refreshUrlTotalPage = totalPage;
            
            
            
        }];
        
        //开始刷新
        [self.tableView.header beginRefreshing];
    }];
    
    //上拉加载
    [[HealthListHelper new] fetchDataWithUrl:self.urlStr Block:^(NSMutableArray *arr) {
        self.healthListeArr = arr;
        [self.tableView reloadData];
    } refreshBlockPageSize:^(NSNumber *pageSize) {
        self.refreshUrlStrPageSize = pageSize;
    } refreshBlockTotalPage:^(NSNumber *totalPage) {
        self.refreshUrlTotalPage = totalPage;
        //如果总的页数大于1，才刷新
        if ([self.refreshUrlTotalPage integerValue] > 1) {
            //上拉加载
            self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
        }
        
    }];
    
    
    
    
    
    
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    //注册自定义cell
    [self.tableView registerNib:[UINib nibWithNibName:@"HealthListCell" bundle:nil] forCellReuseIdentifier:@"HealthListCell"];
    
    [self.view addSubview:self.tableView];
    

}

#pragma mark --UITableViewDataSource代理方法

//cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.healthListeArr.count;
}

//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取model
    HealthListerModel *model = self.healthListeArr[indexPath.row];
    
    if ([model.thumb isEqualToString:@""]) {
        UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.textLabel.text = model.title;
        return cell;
    }else{
        HealthListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HealthListCell" forIndexPath:indexPath];
        [cell.healthListImgView sd_setImageWithURL:[NSURL URLWithString:model.thumb]];
        cell.healthListLabel.text = model.title;
        return cell;
    }
    
    
}

//cell行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 76;
}


//cell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //当前点击的cell的model
    HealthListerModel *model = self.healthListeArr[indexPath.row];
    HealthDetailVC *detailVC = [[HealthDetailVC alloc] init];
   //属性传值
    detailVC.webViewUrlID = model.ID;
    detailVC.navigationItem.title = model.title;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}






#pragma mark --lazyLoad
- (NSString *)urlStr{
    if (_urlStr == nil) {
        _urlStr = [NSString string];
    }
    return _urlStr;
}

//🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇

- (void)refreshData{
   
    self.currentPage ++;
    //拼接网址
    NSString *str = [NSString stringWithFormat:@"%@&p=%ld&pagesize=%@",self.urlStr,self.currentPage,self.refreshUrlStrPageSize];
    //再次请求数据
    [[HealthListHelper new] fetchDataWithUrl:str Block:^(NSMutableArray *arr) {
        //将新请求的数据添加进数组，使加载后的数据仍然存在
        [self.healthListeArr addObjectsFromArray:[arr copy]];

        [self.tableView reloadData];
        
    } refreshBlockPageSize:^(NSNumber *pagesiaze) {
        self.refreshUrlStrPageSize = pagesiaze;
    } refreshBlockTotalPage:^(NSNumber *totalPage) {
        self.refreshUrlTotalPage = totalPage;

        if (self.currentPage == [self.refreshUrlTotalPage integerValue]) {
            [self.tableView.footer noticeNoMoreData];
            //隐藏当前的上拉加载控件
            self.tableView.footer.hidden = YES;
        }
        
        [self.tableView.footer endRefreshing];

    }];
  }





//🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇


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
