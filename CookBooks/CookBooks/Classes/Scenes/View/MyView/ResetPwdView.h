//
//  ResetPwdView.h
//  CookBooks
//
//  Created by 李鹏达 on 15/10/12.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResetPwdView : UIView

//邮箱
@property (nonatomic,strong)UILabel *mailLabel;
@property (nonatomic,strong)UITextField *mailTxtField;

//手机号
@property (nonatomic,strong)UILabel *phoneLabel;
@property (nonatomic,strong)UITextField *phoneTxtField;

//重置button
@property (nonatomic,strong)UIButton *resetBtn;

@end
