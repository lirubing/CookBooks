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
#import "SmallClassesifyModel.h"
#import "HeaderURL.h"
#import "CookingStepsVC.h"
#import "UIImageView+WebCache.h"
#import "SmallClassesifyHelpers.h"
#import "MaterialModel.h"


@interface DetailsListVC ()

@end

@implementation DetailsListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 修改返回按钮颜色
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
  
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailsListCell" bundle:nil] forCellReuseIdentifier:@"details"];
    
    // 传值
    [[DetailsListHelpers detailsListShare] getDetailsString:self.idUrl ListUrl:^{
        [self.tableView reloadData];
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

    return [[[DetailsListHelpers detailsListShare] mutArr] count];
}

// 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailsListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"details" forIndexPath:indexPath];
    DetailsListModel *model = [[DetailsListHelpers detailsListShare] mutArr][indexPath.row];
    
    [cell setDetalisModel:model];

    return cell;
}

// 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 改变选中cell后状态
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    CookingStepsVC *stepVC = [CookingStepsVC new];
    
    // 图片接口拼接
    DetailsListModel *model = [DetailsListHelpers detailsListShare].mutArr[indexPath.row];
    NSString *imgUrl = [NSString stringWithFormat:@"http://pic.ecook.cn/web/%@.jpg!m3",model.imageid];
    stepVC.urlstr = imgUrl;
    
   

    // 材料
    // 步骤
    stepVC.name = indexPath.row;
    stepVC.step = indexPath.row;
 
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.5f];
    [animation setTimingFunction:[CAMediaTimingFunction
                                  functionWithName:kCAMediaTimingFunctionEaseIn]];
    [animation setType:kCATransitionReveal];
    [animation setSubtype: kCATransitionFromRight];
    [self.view.layer addAnimation:animation forKey:@"Reveal"];
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    [self.navigationController pushViewController:stepVC animated:NO];




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
