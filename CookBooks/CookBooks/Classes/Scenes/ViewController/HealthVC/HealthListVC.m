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




#define DefaultURL @"http://iapi.ipadown.com/api/yangshen/page.list.api.php?siteid=8&catename=%E9%A5%AE%E9%A3%9F%E5%85%BB%E7%94%9F&orderby=edittime"

@interface HealthListVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation HealthListVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //解析数据
    
    [[HealthListHelper shareHelper] fetchDataWithUrl:DefaultURL Block:^(NSMutableArray *arr) {
        self.healthListeArr = arr;
        [self.tableView reloadData];
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
    
    if (model.thumb == nil) {
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
    return 66;
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
