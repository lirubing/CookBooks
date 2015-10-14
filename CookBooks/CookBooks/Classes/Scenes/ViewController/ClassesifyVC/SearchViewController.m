//
//  SearchViewController.m
//  CookBooks
//
//  Created by lanou3g on 15/10/13.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "SearchViewController.h"
#import "ClassesHomeVC.h"
#import "AFHTTPRequestOperationManager.h"
#import "DetailsListModel.h"
#import "DetailsListCell.h"
#import "SearchCookCell.h"
#import "UIImageView+WebCache.h"
#import "SearchDetailsVC.h"
#import "DetailsListHelpers.h"
#import "CookingStepsVC.h"


@interface SearchViewController ()<UISearchBarDelegate>



@property (nonatomic,strong) UILabel *contentLabel;

@property (nonatomic,strong) NSMutableArray *searchArr;
@property (nonatomic,strong) UISearchBar *bar;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _bar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    _bar.delegate = self;
    self.navigationItem.titleView = _bar;
    
    _bar.placeholder = @"搜索你喜欢的美食";
    [self.tableView registerNib:[UINib nibWithNibName:@"SearchCookCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}

// 搜索框
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self searchNSSting:searchText];
}


- (void)searchNSSting:(NSString *)str{
    
    NSString *url = @"http://www.ecook.cn/public/searchRecipe.shtml";
    NSDictionary *dic = @{@"begin":@"0",@"machine":@"7e7a5fcaf52bdc3ed872d20690f41cde",@"queryString":str,@"version":@"11.1.3"};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:dic success:^void(AFHTTPRequestOperation * task, id result) {
        [self.searchArr removeAllObjects];
        NSArray *arr = result[@"contentList"];
        for (NSDictionary *dic in arr) {
            DetailsListModel *model=[DetailsListModel new];
            [model setValuesForKeysWithDictionary:dic];
            // 存取解析出来的全部的model
            [self.searchArr addObject:model];
        }
        // 材料
        [self.nameArr removeAllObjects];
        for (NSDictionary *dic in [result objectForKey:@"contentList"]) {
            NSArray *arr = [dic objectForKey:@"materialList"];
            [self.nameArr addObject:arr];
        }
        // 步骤
        [self.stepArr removeAllObjects];
        for (NSDictionary *dic in [result objectForKey:@"contentList"]) {
            NSArray *arr = [dic objectForKey:@"stepList"];
            [self.stepArr addObject:arr];
        }

        [self.tableView reloadData];
    } failure:^void(AFHTTPRequestOperation * task, NSError * error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.searchArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 92;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchCookCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    DetailsListModel *model = self.searchArr[indexPath.row];
    cell.label.text = model.content;
    cell.nameLabel.text = model.name;
    NSString *imgUrl = [NSString stringWithFormat:@"http://pic.ecook.cn/web/%@.jpg!m3",model.imageid];
    [cell.img sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
    SearchDetailsVC *searchDetails = [SearchDetailsVC new];
    DetailsListModel *model = self.searchArr[indexPath.row];
    

    searchDetails.imgURL = model.imageid;
    searchDetails.nameArr = self.nameArr[indexPath.row];
    searchDetails.stepArr = self.stepArr[indexPath.row];
    searchDetails.navigationItem.title = model.name;
    
    
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.5f];
    [animation setTimingFunction:[CAMediaTimingFunction
                                  functionWithName:kCAMediaTimingFunctionEaseIn]];
    [animation setType:kCATransitionReveal];
    [animation setSubtype: kCATransitionFromRight];
    [self.view.layer addAnimation:animation forKey:@"Reveal"];
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    [self.navigationController pushViewController:searchDetails animated:YES];

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

-(NSMutableArray *)searchArr
{
    if (_searchArr == nil) {
        _searchArr = [NSMutableArray new];
    }
    return _searchArr;
}

- (NSMutableArray *)nameArr
{
    if (_nameArr == nil) {
        _nameArr = [NSMutableArray new];
    }
    return _nameArr;
}

- (NSMutableArray *)stepArr
{
    if (_stepArr == nil) {
        _stepArr = [NSMutableArray new];
    }
    return _stepArr;
}
@end
