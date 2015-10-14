//
//  HomeDetaRelation.m
//  CookBooks
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeDetaRelation.h"
#import "HomeDetaHelper.h"
#import "HomeCellTwoTVC.h"

@interface HomeDetaRelation ()
@property (nonatomic,strong) NSString * imgRelation;
@property (nonatomic,strong) NSString * arrKey;
@property (nonatomic,strong) NSString * arrkey2;
@property (nonatomic,strong) NSMutableArray * arrValue;
@property (nonatomic,strong) NSMutableDictionary * diction;
@property (nonatomic,strong) NSString * material_name;
@end

@implementation HomeDetaRelation

//代理方法,详情页
-(NSString *)segmentTitle
{
    return @"相克相宜";
}

-(UIScrollView *)streachScrollView
{
    return self.tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeCellTwoTVC" bundle:nil] forCellReuseIdentifier:@"cell"];
    

    [self requestWithHomeDetaHelperID:self.ID Name:@"DishesSuitable" finish:^{
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 40, 170)];
        [img sd_setImageWithURL:[NSURL URLWithString:self.imgRelation]];
        self.tableView.tableHeaderView = img;
        
        [self.tableView reloadData];
    }];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
}

//请求数据
- (void)requestWithHomeDetaHelperID:(NSInteger)dishes_id Name:(NSString *)methodName finish:(void (^)())block{
    
    NSNumber *num = [NSNumber numberWithInteger:dishes_id];
    
    NSDictionary * dic = @{@"dishes_id":num,@"methodName":methodName,@"version":@"1.0"};

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:kHomeURL parameters:dic success:^void(NSURLSessionDataTask * task, id reslut) {
        
        NSDictionary *dicAll = [reslut objectForKey:@"data"];

        
            //相宜相克
        
            NSDictionary *dicRelation = [dicAll objectForKey:@"material"];
        
            self.imgRelation = [dicRelation objectForKey:@"image"];
            self.material_name = [dicRelation objectForKey:@"material_name"];
        
            for (NSString *key in dicRelation) {
                if ([key isEqualToString:@"suitable_not_with"]) {
                    self.arrValue = nil;
                    self.arrKey = key;
                    
                    for (NSDictionary *dic in dicRelation[self.arrKey]) {
                        HomeModel *model = [HomeModel new];
                        [model setValuesForKeysWithDictionary:dic];
                        [self.arrValue addObject:model];
                        
                    }
                    
                    [self.diction setObject:self.arrValue forKey:self.arrKey];
                    
                }
                else if ([key isEqualToString:@"suitable_with"]) {
                    
                    self.arrValue = nil;
                    self.arrkey2 = key;
                    
                    for (NSDictionary *dic in dicRelation[self.arrkey2]) {
                        HomeModel *model = [HomeModel new];
                        [model setValuesForKeysWithDictionary:dic];
                        [self.arrValue addObject:model];
                        
                    }
                    
                    [self.diction setObject:self.arrValue forKey:self.arrkey2];

                }
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
    return [[self.diction allKeys] count];
}
//cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[self.diction objectForKey:([self.diction allKeys][section])] count];

}
//高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

//区尾
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section == 1) {
        return @"                                   没有更多了  ";
        
    }
    return nil;
}

//区名
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    //如果第一个分区数组不为0才返回
    if (section == 0) {
        
        if ([[self.diction objectForKey:self.arrKey] count] == 0) {
            NSString *str = @"      ";
            return str;
        }
        
        return [NSString stringWithFormat:@"与%@搭配相克的东西",self.material_name];
    }

    
    
    if ([[self.diction objectForKey:self.arrkey2] count] == 0) {
        NSString *str = @"      ";
        return str;
    }
    return  [NSString stringWithFormat:@"与%@搭配相宜的东西",self.material_name];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 30;
    }
    return 16;
}


//返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCellTwoTVC *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        
        HomeModel *model = [self.diction objectForKey:self.arrKey][indexPath.row];
        cell.model1 = model;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
    
    HomeModel *model = [self.diction objectForKey:self.arrkey2][indexPath.row];
    cell.model1 = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
    }
    
}


//懒加载


- (NSMutableArray *)arrValue{
    if (_arrValue == nil) {
        _arrValue = [NSMutableArray array];
    }
    return _arrValue;
}

- (NSMutableDictionary *)diction{
    if (_diction == nil) {
        _diction = [NSMutableDictionary dictionary];
    }
    return _diction;
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
