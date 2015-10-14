//
//  LoginAgainView.h
//  CookBooks
//
//  Created by 李鹏达 on 15/10/12.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginAgainView : UIView

//账号
@property (nonatomic,strong)UILabel *idLabel;
@property (nonatomic,strong)UITextField *idField;

//密码
@property (nonatomic,strong)UILabel *pwdLabel;
@property (nonatomic,strong)UITextField *pwdTxtField;

//登陆button
@property (nonatomic,strong)UIButton *lgBtn;

//注册btn
@property (nonatomic,strong)UIButton *registBtn;

//忘记密码btn
@property (nonatomic,strong)UIButton *forgetPwdBtn;


@end
