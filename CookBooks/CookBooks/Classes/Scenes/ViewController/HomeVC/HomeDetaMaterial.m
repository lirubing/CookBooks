//
//  HomeDetaMaterial.m
//  CookBooks
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeDetaMaterial.h"
#import "HomeDetaHelper.h"
#import "HomeDetaMater.h"
#import "HomeDetaMaterOC.h"

@interface HomeDetaMaterial ()
@property (nonatomic,strong) NSMutableArray * arrC;
@property (nonatomic,strong) NSMutableArray * arrC2;
@property (nonatomic,strong) NSString * material_image;
@end

@implementation HomeDetaMaterial

//代理方法,详情页
-(NSString *)segmentTitle
{
    return @"材料准备";
}

-(UIScrollView *)streachScrollView
{
    return self.tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeDetaMaterOC" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeDetaMater" bundle:nil] forCellReuseIdentifier:@"cell1"];
    
    
    [self requestWithHomeDetaHelperID:self.ID Name:@"DishesMaterial" finish:^{
        
        //区头的图片
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 40, 170)];
        [img sd_setImageWithURL:[NSURL URLWithString:self.material_image]];
         self.tableView.tableHeaderView = img;
         
         [self.tableView reloadData];
    }];
        
    

}


//请求数据
- (void)requestWithHomeDetaHelperID:(NSInteger)dishes_id Name:(NSString *)methodName finish:(void (^)())block{
    
    NSNumber *num = [NSNumber numberWithInteger:dishes_id];
    
    NSDictionary * dic = @{@"dishes_id":num,@"methodName":methodName,@"version":@"1.0"};

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:kHomeURL parameters:dic success:^void(NSURLSessionDataTask * task, id reslut) {
        
        NSDictionary *dicAll = [reslut objectForKey:@"data"];

        //材料准备
        for (NSDictionary *d2 in [dicAll objectForKey:@"material"]) {
            HomeModel *model = [HomeModel new];
            [model setValuesForKeysWithDictionary:dicAll];
            [model setValuesForKeysWithDictionary:d2];
            [self.arrC addObject:model];
            self.material_image = model.material_image;
        }
        for (NSDictionary *d3 in [dicAll objectForKey:@"spices"]) {
            HomeModel *model = [HomeModel new];
            [model setValuesForKeysWithDictionary:d3];
            [self.arrC2 addObject:model];
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
//分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}
//cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return self.arrC.count;
    }
    
    return self.arrC2.count;
}
//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return 200;
    }
    return 50;
}

//返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        HomeDetaMaterOC *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        HomeModel *model = self.arrC[indexPath.row];
        cell.model = model;
        return cell;
    }
    
    HomeDetaMater *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    HomeModel *model = [HomeModel new];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    model = self.arrC2[indexPath.row];
    cell.model = model;
    return cell;
}

- (NSMutableArray *)arrC{
    if (_arrC == nil) {
        _arrC = [NSMutableArray array];
    }
    return _arrC;
}

- (NSMutableArray *)arrC2{
    if (_arrC2 == nil) {
        _arrC2 = [NSMutableArray array];
    }
    return _arrC2;
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
