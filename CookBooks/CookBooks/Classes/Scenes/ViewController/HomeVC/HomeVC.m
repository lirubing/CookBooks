//
//  HomeVC.m
//  Cookbook
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeVC.h"
#import "HomeView.h"
#import "HomeHelper.h"
#import "HomeCellOneTVC.h"
#import "HomeModel.h"
#import "UIImageView+WebCache.h"
#import "HomeCellTwoTVC.h"
#import "MJRefresh.h"

@interface HomeVC ()
{
    UIView *_view;
}


//详情页的控制器
@property (nonatomic, strong) ARSegmentPageController *pager;

@property (nonatomic,strong) UIImage * blurImage;

@property (nonatomic,strong) UIImage * defaultImage;
@property (nonatomic,strong) HomeDetaDoing *one;
@property (nonatomic,strong) HomeDetaMaterial *two;
@property (nonatomic,strong) HomeDetaKnowledge *three;
@property (nonatomic,strong) HomeDetaRelation *four;
@end

@implementation HomeVC


- (void)viewWillAppear:(BOOL)animated{

    //视图将要加载的时候 开始刷新
    [self.tableView.header beginRefreshing];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //上拉刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [[HomeHelper shareHomeHelper] requestWithHomeFinish:^{
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        }];

    }];
    
    
    //设置yableView区头
    HomeView *viewC = [HomeView new];
    viewC.view.frame = CGRectMake(0, 0, 375, 375);
    [viewC drawMyTableHeader];
    self.tableView.tableHeaderView = viewC.view;
    [self addChildViewController:viewC];



    //背景色
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellEditingStyleNone;

    
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeCellOneTVC" bundle:nil] forCellReuseIdentifier:@"one"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeCellTwoTVC" bundle:nil] forCellReuseIdentifier:@"two"];

    
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

#pragma mark - Table view data source
//分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

//cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return [HomeHelper shareHomeHelper].arrayNew.count;
    }

    return [HomeHelper shareHomeHelper].arrayRan.count;
}
//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 198;
    }
    return 110;
}

//分区的颜色
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    view.tintColor = [UIColor whiteColor];
}


//区头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 1) {
        [self drawSectionViewSection:section];
    }
    
    return _view;
}


//区尾
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section == 1) {
        return @"                                   没有更多了  ";
        
    }
    return nil;
}

//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self getHomeDetaVC];
    
    if (indexPath.section == 0) {
        HomeModel *model = [HomeModel new];
        model = [HomeHelper shareHomeHelper].arrayNew[indexPath.row];
        self.one.ID = [model.id_home integerValue];
        self.two.ID = [model.id_home integerValue];
        self.three.ID = [model.id_home integerValue];
        self.four.ID = [model.id_home integerValue];
        self.pager.navigationItem.title = model.title;
        [self.navigationController pushViewController:self.pager animated:YES];
        return;

    }
    
    HomeModel *model = [HomeModel new];
    model = [HomeHelper shareHomeHelper].arrayRan[indexPath.row];
    self.one.ID = [model.id_home integerValue];
    self.two.ID = [model.id_home integerValue];
    self.three.ID = [model.id_home integerValue];
    self.four.ID = [model.id_home integerValue];
    
    self.pager.navigationItem.title = model.title;
    [self.navigationController pushViewController:self.pager animated:YES];
    
    
}

//返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        HomeCellOneTVC *cell = [tableView dequeueReusableCellWithIdentifier:@"one" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        HomeModel *model = [HomeHelper shareHomeHelper].arrayNew[indexPath.row];
        [cell.img4CellO sd_setImageWithURL:[NSURL URLWithString:model.image]];
        cell.img4CellO.contentMode = UIViewContentModeScaleToFill;
        return cell;
    }
    
    HomeCellTwoTVC *cell = [tableView dequeueReusableCellWithIdentifier:@"two" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    HomeModel *model = [HomeHelper shareHomeHelper].arrayRan[indexPath.row];
    cell.model = model;
    return cell;
    
}

//区头view
- (void)drawSectionViewSection:(NSInteger)section{
     _view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 60)];
    UILabel *labelLeft = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 100, 10)];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(300, 0, 70, 10)];
    [button setTitle:@"更多》" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(moreAction) forControlEvents:UIControlEventTouchUpInside];
        labelLeft.text = @"排行榜";
    
    [_view addSubview:labelLeft];
    [_view addSubview:button];
}

//更多点击事件
- (void)moreAction{
    
    
    
    
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
