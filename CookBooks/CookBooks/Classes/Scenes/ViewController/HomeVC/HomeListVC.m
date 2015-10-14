//
//  HomeListVC.m
//  CookBooks
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeListVC.h"
#import "HomeHelper.h"
#import "HomeCellOneTVC.h"
#import "UIImageView+WebCache.h"
#import "HomeModel.h"
#import "MJRefresh.h"

@interface HomeListVC ()
{
    NSInteger _currentPage;
}
@property (nonatomic,strong) NSMutableArray * arrayAll;


//详情页的控制器
@property (nonatomic, strong) ARSegmentPageController *pager;

@property (nonatomic,strong) UIImage * blurImage;

@property (nonatomic,strong) UIImage * defaultImage;
@property (nonatomic,strong) HomeDetaDoing *one;
@property (nonatomic,strong) HomeDetaMaterial *two;
@property (nonatomic,strong) HomeDetaKnowledge *three;
@property (nonatomic,strong) HomeDetaRelation *four;
@end

@implementation HomeListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _currentPage = 1;


    //请求数据
    [self requestHomeListWithPage:_currentPage id_h:self.ID finish:^{
        
                //顶部显示
                self.navigationItem.title = [NSString stringWithFormat:@"%@%@道",self.textName,self.num];
        
                [self.tableView reloadData];
        
                //刷新的方法
                [self pullLoad];
        
    }];
    
    
    
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeCellOneTVC" bundle:nil] forCellReuseIdentifier:@"cell"];
    

    
}


//请求数据的方法
- (void)requestHomeListWithPage:(NSInteger)currentPage id_h:(NSString *)id_home finish:(void (^)())block{
    
    NSNumber *num = [NSNumber numberWithInteger:currentPage];
    NSDictionary *dic = @{@"methodName":@"HomeSerial",@"page":num,@"serial_id":id_home,@"size":@"6",@"user_id":@"0",@"version":@"1.0"};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:kHomeURL parameters:dic success:^void(NSURLSessionDataTask * task, id reslut) {
        NSDictionary *dic = [reslut objectForKey:@"data"];
        NSArray *arr = [dic objectForKey:@"data"];
        for (NSDictionary *dic1 in arr) {
            HomeModel *model = [HomeModel new];
            [model setValuesForKeysWithDictionary:dic1];
            [model setValuesForKeysWithDictionary:dic];
            self.num  = model.total;
            [self.arrayAll addObject:model];
        }
        block();
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        
    }];
    
    
}





#pragma mark ------------上拉刷新,下拉加载----------
//上拉加载
- (void)pullLoad{
    
    _currentPage++;

    [self.tableView.footer beginRefreshing];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadLatData)];
    

}

//加载
- (void)loadLatData{
    
    [self requestHomeListWithPage:_currentPage id_h:self.ID finish:^{
        _currentPage++;
        [self.tableView reloadData];
        
        [self.tableView.footer endRefreshing];

        //如果是最后一条  显示没有更多数据了
        NSNumber *n = (NSNumber *)self.num;
        NSInteger num1 = [n integerValue];
        if (self.arrayAll.count == num1 ) {
            [self.tableView.footer noticeNoMoreData];
        }
    
        
    }];
}


#pragma mark ------------HomeDeatVC----------
//详情页的控制器
- (void)getHomeDetaVC{
    
    self.blurImage = [UIImage imageNamed:@"终极版"];
    self.defaultImage = [UIImage imageNamed:@"终极版"];
    
    self.one = [HomeDetaDoing new];
    self.two = [HomeDetaMaterial new];
    self.three = [[HomeDetaKnowledge alloc]initWithStyle:UITableViewStyleGrouped];
    self.four = [[HomeDetaRelation alloc]initWithStyle:UITableViewStyleGrouped];
    
    ARSegmentPageController *pager = [ARSegmentPageController new];
    pager.headerHeight = 180;
    [pager setViewControllers:@[self.one,self.two,self.three,self.four]];
    
    self.pager = pager;
}

//关于详情页区头图片效果的设置
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    CGFloat topInset = [change[NSKeyValueChangeNewKey] floatValue];
    
    if (topInset <= self.pager.segmentMiniTopInset) {
        self.pager.title = nil;
        self.pager.headerView.imageView.image = self.blurImage;
    }else{
        self.pager.title = nil;
        self.pager.headerView.imageView.image = self.defaultImage;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark ------------ Table view data source------------
//分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
//cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrayAll.count;
}
//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 198;
}

//点击cell的事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self getHomeDetaVC];

    HomeModel *model = [HomeModel new];
    model = self.arrayAll[indexPath.row];
    self.one.ID = [model.dishes_id integerValue];
    self.two.ID = [model.dishes_id integerValue];
    self.three.ID = [model.dishes_id integerValue];
    self.four.ID = [model.dishes_id integerValue];

    self.pager.navigationItem.title = model.title;
    [self.navigationController pushViewController:self.pager animated:YES];

    
}

//返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCellOneTVC *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    HomeModel *model = [HomeModel new];
    model = self.arrayAll[indexPath.row];
    [cell.img4CellO sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
    return cell;
}






#pragma mark -------lazy---------
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
