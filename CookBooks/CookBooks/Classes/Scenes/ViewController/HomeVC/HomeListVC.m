//
//  HomeListVC.m
//  CookBooks
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeListVC.h"
#import "HomeHelper.h"
#import "HomeListHelper.h"
#import "HomeCellOneTVC.h"
#import "UIImageView+WebCache.h"
#import "HomeModel.h"
#import "MJRefresh.h"

@interface HomeListVC ()
{
    NSInteger _currentPage;
}
@property (nonatomic,strong) NSMutableArray * arrayAll;
@end

@implementation HomeListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _currentPage = 1;
    [[HomeListHelper shareHomeList] requestHomeListWithPage:_currentPage id_h:self.ID finish:^{
        [self.arrayAll addObjectsFromArray:[HomeListHelper shareHomeList].array];
        [self.tableView reloadData];
        
        [self pullLoad];
    }];
    
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeCellOneTVC" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
    
}

//上拉加载
- (void)pullLoad{
    
    _currentPage++;

    [self.tableView.footer beginRefreshing];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadLatData)];
    

}

- (void)loadLatData{
    
    [[HomeListHelper shareHomeList] requestHomeListWithPage:_currentPage id_h:self.ID finish:^{
        _currentPage++;
        [self.arrayAll addObjectsFromArray:[HomeListHelper shareHomeList].array];
        [self.tableView reloadData];
        
        //!!! 这块还有问题,没有实现
                    //如果是最后一条,显示没有更多数据
                    NSInteger total = (NSInteger)[HomeListHelper shareHomeList].totalStr;
        if (self.arrayAll.count == total) {
                        [self.tableView.footer noticeNoMoreData];
                    }
        
        [self.tableView.footer endRefreshing];
        
    }];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrayAll.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 198;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCellOneTVC *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    HomeModel *model = [HomeModel new];
    model = self.arrayAll[indexPath.row];
    [cell.img4CellO sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
    return cell;
}

- (NSMutableArray *)arrayAll{
    if (_arrayAll == nil) {
        _arrayAll = [NSMutableArray array];
    }
    return _arrayAll;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
