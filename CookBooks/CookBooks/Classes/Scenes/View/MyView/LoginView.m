//
//  LoginView.m
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self drawView];
    }
    return self;
}

- (void)drawView{
    //背景
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, kScreenWeight, 250)];
    _imgView.image = [UIImage imageNamed:@"登陆背景.jpg"];
    _imgView.userInteractionEnabled = YES;
    [self addSubview:_imgView];
    
    //头像
    _headImgView = [[UIImageView alloc]initWithFrame:CGRectMake(_imgView.bounds.size.width / 2 - 65, 50, 130, 130)];
    _headImgView.backgroundColor = [UIColor redColor];
    _headImgView.layer.cornerRadius = 65;
    [self.imgView addSubview:_headImgView];
    
    //立即登陆
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_loginBtn setTitle:@"立即登录" forState:UIControlStateNormal];
    _loginBtn.frame = CGRectMake(0, 200, kScreenWeight, 40);
    [self.imgView addSubview:_loginBtn];
    
    //立即登陆后button
//    _loginAfterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    _loginAfterBtn.frame = CGRectMake(0, 200, kScreenWeight, 40);
//    [self.imgView addSubview:_loginAfterBtn];
    
    //注销
    _logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_logoutBtn setTitle:@"注销" forState:UIControlStateNormal];
    _logoutBtn.frame = CGRectMake(kScreenWeight - 50, 230, 50, 20);
    [self.imgView addSubview:_logoutBtn];
    
    //夜间模式
    _nightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_nightBtn setTitle:@"夜间模式" forState:UIControlStateNormal];
    _nightBtn.backgroundColor = [UIColor blueColor];
    _nightBtn.frame = CGRectMake(0, 350, kScreenWeight, 40);
    [self addSubview:_nightBtn];
    
    //我的收藏
    _collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_collectBtn setTitle:@"我的收藏" forState:UIControlStateNormal];
    _collectBtn.backgroundColor = [UIColor blueColor];
    _collectBtn.frame = CGRectMake(0, 420, kScreenWeight, 40);
    [self addSubview:_collectBtn];
    
    //清除缓存
    _catchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_catchBtn setTitle:@"清除缓存" forState:UIControlStateNormal];
    _catchBtn.backgroundColor = [UIColor blueColor];
    _catchBtn.frame = CGRectMake(0, 490, kScreenWeight, 40);
    [self addSubview:_catchBtn];
    
    //意见反馈
    _opinionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_opinionBtn setTitle:@"意见反馈" forState:UIControlStateNormal];
    _opinionBtn.backgroundColor = [UIColor blueColor];
    _opinionBtn.frame = CGRectMake(0, 560, kScreenWeight, 40);
    [self addSubview:_opinionBtn];
    
}

@end
