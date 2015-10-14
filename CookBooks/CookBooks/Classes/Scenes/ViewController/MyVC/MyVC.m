//
//  MyVC.m
//  CookBooks
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "MyVC.h"
#import "LoginView.h"
#import "LoginController.h"
#import "HomeVC.h"

@interface MyVC ()

@end

@implementation MyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _loginView = [[LoginView alloc]init];
    self.view = _loginView;
    
    _loginController = [LoginController new];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    AVUser *currentUser = [AVUser currentUser];
    if (currentUser != nil) {
        [_loginView.loginBtn setTitle:currentUser.username forState:UIControlStateNormal];
        [_loginView.loginBtn addTarget:self action:@selector(hehe) forControlEvents:UIControlEventTouchUpInside];

        [_loginView.logoutBtn setTitle:@"注销" forState:UIControlStateNormal];
        [_loginView.logoutBtn addTarget:self action:@selector(logoutAction) forControlEvents:UIControlEventTouchUpInside];
        _loginView.headImgView.image = [UIImage imageNamed:@"yuzhitu"];
    } else {
        [_loginView.loginBtn setTitle:@"立即登录" forState:UIControlStateNormal];
        [_loginView.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        _loginView.headImgView.image = [UIImage imageNamed:@"yuzhitu"];

    }
    
}

- (void)hehe{
    NSLog(@"hehehehehhehehheheheehhe");

}

//登陆
- (void)login{
    
    [self.navigationController pushViewController:_loginController animated:NO];
    NSLog(@"fuckfuckfuckfukc");
    
}


//注销
- (void)logoutAction{
    UIAlertController *logoutAlertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否注销当前用户" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *logoutAlectAction = [UIAlertAction actionWithTitle:@"注销" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [AVUser logOut];
        [_loginView.loginBtn setTitle:@"立即登录" forState:UIControlStateNormal];
        [_loginView.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        [_loginView.logoutBtn setTitle:nil forState:UIControlStateNormal];
        [_loginView.logoutBtn addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];

    }];
    UIAlertAction *dontLogoutAlectAction = [UIAlertAction actionWithTitle:@"再逛逛" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }];
    [logoutAlertController addAction:logoutAlectAction];
    [logoutAlertController addAction:dontLogoutAlectAction];
    [self presentViewController:logoutAlertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
