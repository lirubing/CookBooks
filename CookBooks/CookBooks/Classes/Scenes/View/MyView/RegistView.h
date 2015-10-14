//
//  RegistView.h
//  CookBooks
//
//  Created by 李鹏达 on 15/10/12.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistView : UIView

//用户名
@property (nonatomic,strong)UILabel *idLabel;
@property (nonatomic,strong)UITextField *idTxtField;

//密码
@property (nonatomic,strong)UILabel *pwdLabel;
@property (nonatomic,strong)UITextField *pwdTxtField;

//确认密码
@property (nonatomic,strong)UILabel *confirmPwdLabel;
@property (nonatomic,strong)UITextField *confirmPwdTxtField;

//邮箱
@property (nonatomic,strong)UILabel *mailLabel;
@property (nonatomic,strong)UITextField *mailTxtField;

//手机号
@property (nonatomic,strong)UILabel *phoneLabel;
@property (nonatomic,strong)UITextField *phoneTxtField;

//注册button
@property (nonatomic,strong)UIButton *registBtn;

@end
