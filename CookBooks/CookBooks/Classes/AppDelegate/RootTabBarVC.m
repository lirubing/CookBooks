//
//  RootTabBarVC.m
//  Cookbook
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "RootTabBarVC.h"
#import "HomeVC.h"
#import "HealthHomeVC.h"
#import "MyVC.h"
#import "ClassesHomeVC.h"

@interface RootTabBarVC ()

@end

@implementation RootTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
  

    [self setUpAllChildViewController];


}

- (void)setUpAllChildViewController{
    
    // 1.添加第一个控制器
    HomeVC *oneVC = [[HomeVC alloc]initWithStyle:UITableViewStyleGrouped];
  
    [self setUpOneChildViewController:oneVC image:[UIImage imageNamed:@"小主页"] title:@"首页"];
    oneVC.navigationItem.title = @"主页";
    
    
    
    // 2.添加第2个控制器
    ClassesHomeVC *tabBarVC = [[ClassesHomeVC alloc]init];
    [self setUpOneChildViewController:tabBarVC image:[UIImage imageNamed:@"小分类"] title:@"分类"];
    tabBarVC.navigationItem.title = @"分类";
    
    // 3.添加第3个控制器
    HealthHomeVC *threeVC = [[HealthHomeVC alloc]init];
    
    [self setUpOneChildViewController:threeVC image:[UIImage imageNamed:@"小营养"] title:@"营养说"];
    threeVC.navigationItem.title = @"营养说";
    
    // 4.添加第4个控制器
    MyVC *fourVC = [[MyVC alloc]init];
    [self setUpOneChildViewController:fourVC image:[UIImage imageNamed:@"小我的"] title:@"我的"];
    
 
}


/**
 *  添加一个子控制器的方法
 */
- (void)setUpOneChildViewController:(UIViewController *)viewController image:(UIImage *)image title:(NSString *)title{
    
    UINavigationController *navC = [[UINavigationController alloc]initWithRootViewController:viewController];
    navC.title = title;
    navC.tabBarItem.image = image;
    
    viewController.navigationItem.title = title;
    [self addChildViewController:navC];
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
