//
//  HomeDetaKnowledge.m
//  CookBooks
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeDetaKnowledge.h"
#import "HomeKnowCell.h"

@interface HomeDetaKnowledge ()

@property (nonatomic,strong)NSMutableArray * arrKnow;
@property (nonatomic,strong)NSString * imgKnow;

@end

@implementation HomeDetaKnowledge


//代理方法,详情页
-(NSString *)segmentTitle
{
    return @"相关常识";
}

-(UIScrollView *)streachScrollView
{
    return self.tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self requestWithHomeDetaHelperID:self.ID Name:@"DishesCommensense"];
    
    [self.tableView registerClass:[HomeKnowCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
}

//请求数据
- (void)requestWithHomeDetaHelperID:(NSInteger)dishes_id Name:(NSString *)methodName{
    NSNumber *num = [NSNumber numberWithInteger:dishes_id];
    
    NSDictionary *dic = @{@"dishes_id":num,@"methodName":methodName,@"version":@"1.0"};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:kHomeURL parameters:dic success:^void(NSURLSessionDataTask * task, id reslut) {
        
        NSDictionary *dic = [reslut objectForKey:@"data"];
        
            //相关常识
        HomeModel *model = [HomeModel new];
        model.nutrition_analysis = dic[@"nutrition_analysis"];
        model.production_direction = dic[@"production_direction"];
        self.imgKnow = dic[@"image"];
        [self.arrKnow addObject:model];
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 40, 170)];
        [img sd_setImageWithURL:[NSURL URLWithString:self.imgKnow]];
        self.tableView.tableHeaderView = img;
        
        [self.tableView reloadData];
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"相关常识";
    }
    return @"制作指导";
}

//cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrKnow.count;
}

//区尾
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section == 1) {
        return @"                                   没有更多了  ";
        
    }
    return nil;
}

//cell自适应高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    HomeModel *model = self.arrKnow[indexPath.row];
    if (indexPath.section == 0) {
        return [self testHeight:model.nutrition_analysis] + 20;
    }

    return [self testHeight:model.production_direction] + 20;
    
}

//区头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 30;
    }
    return 14;
}



//返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    HomeKnowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        HomeModel *model = self.arrKnow[indexPath.row];
    if (indexPath.section == 0) {
        cell.label.text = model.nutrition_analysis;
        cell.label.frame = CGRectMake(10, 10, 335, [self testHeight:model.nutrition_analysis]);
        return cell;
        
    }
    cell.label.text = model.production_direction;
    cell.label.frame = CGRectMake(10, 10, 335, [self testHeight:model.production_direction]);
    return cell;
}

//自适应高度
- (CGFloat)testHeight:(NSString *)str{
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    CGRect rect = [str boundingRectWithSize:CGSizeMake(335, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return rect.size.height;
}


//相关常识
- (NSMutableArray *)arrKnow{
    if (_arrKnow == nil) {
        _arrKnow = [NSMutableArray array];
    }
    return _arrKnow;
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
