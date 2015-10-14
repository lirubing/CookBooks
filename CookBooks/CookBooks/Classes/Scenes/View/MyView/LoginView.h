//
//  LoginView.h
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView

//背景
@property (nonatomic,strong)UIImageView *imgView;

//头像
@property (nonatomic,strong)UIImageView *headImgView;

//立即登陆
@property (nonatomic,strong)UIButton *loginBtn;

//立即登陆后button
@property (nonatomic,strong)UIButton *loginAfterBtn;

//夜间模式
@property (nonatomic,strong)UIButton *nightBtn;

//我的收藏
@property (nonatomic,strong)UIButton *collectBtn;

//清除缓存
@property (nonatomic,strong)UIButton *catchBtn;

//意见反馈
@property (nonatomic,strong)UIButton *opinionBtn;

//注销
@property (nonatomic,strong)UIButton *logoutBtn;


@end
