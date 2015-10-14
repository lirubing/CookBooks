//
//  HealthHomeVC.m
//  Cookbook
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HealthHomeVC.h"
#import "HealthHomeModel.h"
#import "HealthListVC.h"
#import "JDSideMenu.h"
#import "HealthDrawerVC.h"


//点击主页列表页，为第一次进入的默认显示页
#define DefaultURL @"http://iapi.ipadown.com/api/yangshen/page.list.api.php?siteid=8&catename=%E9%A5%AE%E9%A3%9F%E5%85%BB%E7%94%9F&orderby=edittime"

@interface HealthHomeVC ()


@end

@implementation HealthHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //抽屉
    HealthDrawerVC *menuVC = [[HealthDrawerVC alloc] init];
    
    //主页
    HealthListVC *listVC = [HealthListVC new];
    //传值，使第一次显示的页面为此网址的内容
    listVC.urlStr = DefaultURL;
    
    
    JDSideMenu *sideMenu = [[JDSideMenu alloc] initWithContentController:listVC menuController:menuVC];
    
    //添加子视图控制器
    [self addChildViewController:sideMenu];
    [self.view addSubview:sideMenu.view];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
