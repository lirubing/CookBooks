//
//  LoginAgainView.m
//  CookBooks
//
//  Created by 李鹏达 on 15/10/12.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "LoginAgainView.h"

@implementation LoginAgainView

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
    
    _idField = [[UITextField alloc]initWithFrame:CGRectMake(120, 100, 200, 30)];
    _idField.borderStyle = UITextBorderStyleRoundedRect;
    _idField.placeholder = @"请输入用户名";
    [self addSubview:_idField];
    
    //密码
    _pwdLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 150, 50, 30)];
    _pwdLabel.text = @"密码";
    [self addSubview:_pwdLabel];
    
    _pwdTxtField = [[UITextField alloc]initWithFrame:CGRectMake(120, 150, 200, 30)];
    _pwdTxtField.borderStyle = UITextBorderStyleRoundedRect;
    _pwdTxtField.placeholder = @"请输入密码";
    [self addSubview:_pwdTxtField];
    
    //登陆btn
    _lgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _lgBtn.frame = CGRectMake(kScreenWeight / 2 - 150, 200, 300, 40);
    _lgBtn.backgroundColor = [UIColor blueColor];
    [_lgBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [self addSubview:_lgBtn];
    
    //注册btn
    _registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _registBtn.frame = CGRectMake(280, 260, 40, 30);
    [_registBtn setTitle:@"注册" forState:UIControlStateNormal];
    [_registBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self addSubview:_registBtn];
    
    //忘记密码btn
    _forgetPwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _forgetPwdBtn.frame = CGRectMake(280, 300, 80, 30);
    [_forgetPwdBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [_forgetPwdBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self addSubview:_forgetPwdBtn];
    
    //选择登陆方式
    UILabel *txt2Label = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWeight / 2 - 42, kScreenHeight / 3 + 250, 200, 40)];
    txt2Label.text = @"第三方登陆";
    txt2Label.textColor = [UIColor redColor];
    [self addSubview:txt2Label];
    
    //分割线
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWeight / 2 - 135, kScreenHeight / 3 + 270, 80, 1)];
    lineView.backgroundColor = [UIColor redColor];
    [self addSubview:lineView];
    
    //分割线2
    UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(kScreenWeight / 2 + 55 , kScreenHeight / 3 + 270, 80, 1)];
    lineView2.backgroundColor = [UIColor redColor];
    [self addSubview:lineView2];
    
    //微信
    UIImageView *wxImgView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWeight / 4 - 25, kScreenHeight / 3 + 320, 50, 50)];
    wxImgView.image = [UIImage imageNamed:@"iconfont-weixin"];
    [self addSubview:wxImgView];
    
    //微博
    UIImageView *wbImgView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWeight / 2 - 25, kScreenHeight / 3 + 320, 50, 50)];
    wbImgView.image = [UIImage imageNamed:@"iconfont-weibo"];
    wbImgView.userInteractionEnabled = YES;
    [self addSubview:wbImgView];
    
    //QQ
    UIImageView *qqImgView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWeight / 4 * 3 - 25, kScreenHeight / 3 + 320, 50, 50)];
    qqImgView.image = [UIImage imageNamed:@"iconfont-qq"];
    [self addSubview:qqImgView];

    
    
    
    
    
    
    
    
    
}


@end
