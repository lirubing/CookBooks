//
//  ResetPwdView.m
//  CookBooks
//
//  Created by 李鹏达 on 15/10/12.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "ResetPwdView.h"

@implementation ResetPwdView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self drawView];
    }
    return self;
}

- (void)drawView{
    //邮箱
    _mailLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 250, 80, 30)];
    _mailLabel.text = @"邮箱";
    [self addSubview:_mailLabel];
    
    _mailTxtField = [[UITextField alloc]initWithFrame:CGRectMake(120, 250, 200, 30)];
    _mailTxtField.borderStyle = UITextBorderStyleRoundedRect;
    _mailTxtField.placeholder = @"请输入邮箱";
    [self addSubview:_mailTxtField];
    
    _resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _resetBtn.frame = CGRectMake(kScreenWeight / 2 - 150, 400, 300, 40);
    _resetBtn.backgroundColor = [UIColor blueColor];
    [_resetBtn setTitle:@"重置密码" forState:UIControlStateNormal];
    [self addSubview:_resetBtn];
}

@end
