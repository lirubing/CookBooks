//
//  DetailsListVC.m
//  CookBooks
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "DetailsListVC.h"
#import "DetailsListCell.h"
#import "DetailsListHelpers.h"
#import "DetailsListModel.h"

@interface DetailsListVC ()

@end

@implementation DetailsListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self drawHeader];
    
    self.tableView.showsVerticalScrollIndicator = NO;
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailsListCell" bundle:nil] forCellReuseIdentifier:@"details"];
    // 传值
//    [[DetailsListHelpers detailsListShare] getDetailsListUrl:^{
//        [self.tableView reloadData];
//    NSLog(@"%@",[DetailsListHelpers detailsListShare].mutArr);
//    }];
    
}

// 绘制区头
- (void)drawHeader
{
    // 区头
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    headerView.backgroundColor = [UIColor colorWithRed:0.675 green:0.958 blue:1.000 alpha:1.000];
    self.tableView.tableHeaderView = headerView;
    // 添加button
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(20, 24, 40, 25);
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backButton) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:backBtn];
    // 添加图片
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 24, 25, 25)];
    UIImage *img = [UIImage imageNamed:@"back"];
    imgView.image = img;
    [headerView addSubview:imgView];
    
}
// 点击back返回按钮
- (void)backButton
{
    [self dismissViewControllerAnimated:NO completion:nil];
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

//    return [[[DetailsListHelpers detailsListShare] mutArr] count];
    return 20;
}

// 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailsListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"details" forIndexPath:indexPath];
//    DetailsListModel *model = [[DetailsListHelpers detailsListShare] mutArr][indexPath.row];
//    NSLog(@"%@",model);
//    [cell setDetalisModel:model];
    
    
    return cell;
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
