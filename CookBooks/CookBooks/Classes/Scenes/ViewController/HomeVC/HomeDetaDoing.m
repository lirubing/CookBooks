//
//  HomeDetaDoing.m
//  CookBooks
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeDetaDoing.h"
#import "HomeDetaDo.h"
#import "HomeDetaHelper.h"

@interface HomeDetaDoing ()
@property (nonatomic,strong) NSMutableArray * arrD;
@end

@implementation HomeDetaDoing

//代理方法,详情页
-(NSString *)segmentTitle
{
    return @"具体做法";
}

-(UIScrollView *)streachScrollView
{
    return self.tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //请求数据
  [self requestWithHomeDetaHelperID:self.ID Name:@"DishesView" finish:^{
      [self.tableView reloadData];
      
  }];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeDetaDo" bundle:nil] forCellReuseIdentifier:@"cell"];

}

//请求数据
- (void)requestWithHomeDetaHelperID:(NSInteger)dishes_id Name:(NSString *)methodName finish:(void (^)())block{
    
    NSNumber *num = [NSNumber numberWithInteger:dishes_id];
   NSDictionary * dic = @{@"dishes_id":num,@"methodName":methodName,@"user_id":@"0",@"version":@"1.0"};

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:kHomeURL parameters:dic success:^void(NSURLSessionDataTask * task, id reslut) {
        
        NSDictionary *dicAll = [reslut objectForKey:@"data"];
        NSArray *arrDoing = [dicAll objectForKey:@"step"];
        for (NSDictionary *d in arrDoing) {
            HomeModel *model = [HomeModel new];
            [model setValuesForKeysWithDictionary:d];
            [self.arrD addObject:model];
        }
    
        block();
    } failure:^ void(NSURLSessionDataTask * task, NSError * error) {
        NSLog(@"%@",error);
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

    return self.arrD.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 225;
}

//返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     HomeDetaDo*cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    HomeModel *model = self.arrD[indexPath.row];
    cell.model = model;
    return cell;
}


- (NSMutableArray *)arrD{
    if (_arrD == nil) {
        _arrD = [NSMutableArray array];
    }
    return _arrD;
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
