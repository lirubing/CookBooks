//
//  RegistView.m
//  CookBooks
//
//  Created by 李鹏达 on 15/10/12.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "RegistView.h"

@implementation RegistView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self drawView];
    }
    return self;
}

- (void)drawView{
    //用户名
    _idLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 100, 80, 30)];
    _idLabel.text = @"用户名";
    [self addSubview:_idLabel];
    
    _idTxtField = [[UITextField alloc]initWithFrame:CGRectMake(120, 100, 200, 30)];
    _idTxtField.borderStyle = UITextBorderStyleRoundedRect;
    _idTxtField.placeholder = @"请输入用户名";
    [self addSubview:_idTxtField];
    
    //密码
    _pwdLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 150, 80, 30)];
    _pwdLabel.text = @"密码";
    [self addSubview:_pwdLabel];
    
    _pwdTxtField = [[UITextField alloc]initWithFrame:CGRectMake(120, 150, 200, 30)];
    _pwdTxtField.borderStyle = UITextBorderStyleRoundedRect;
    _pwdTxtField.placeholder = @"请输入密码";
    [self addSubview:_pwdTxtField];
    
    //确认密码
    _confirmPwdLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 200, 80, 30)];
    _confirmPwdLabel.text = @"确认密码";
    [self addSubview:_confirmPwdLabel];
    
    _confirmPwdTxtField = [[UITextField alloc]initWithFrame:CGRectMake(120, 200, 200, 30)];
    _confirmPwdTxtField.borderStyle = UITextBorderStyleRoundedRect;
    _confirmPwdTxtField.placeholder = @"请再次输入密码";
    [self addSubview:_confirmPwdTxtField];
    
    //邮箱
    _mailLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 250, 80, 30)];
    _mailLabel.text = @"邮箱";
    [self addSubview:_mailLabel];
    
    _mailTxtField = [[UITextField alloc]initWithFrame:CGRectMake(120, 250, 200, 30)];
    _mailTxtField.borderStyle = UITextBorderStyleRoundedRect;
    _mailTxtField.placeholder = @"请输入邮箱";
    [self addSubview:_mailTxtField];
    
    //手机号
    _phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 300, 80, 30)];
    _phoneLabel.text = @"手机号";
    [self addSubview:_phoneLabel];
    
    _phoneTxtField = [[UITextField alloc]initWithFrame:CGRectMake(120, 300, 200, 30)];
    _phoneTxtField.borderStyle = UITextBorderStyleRoundedRect;
    _phoneTxtField.placeholder = @"请输入电话号码";
    [self addSubview:_phoneTxtField];
    
    _registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _registBtn.frame = CGRectMake(kScreenWeight / 2 - 150, 400, 300, 40);
    _registBtn.backgroundColor = [UIColor blueColor];
    [_registBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self addSubview:_registBtn];
    
}


@end
