//
//  MyVC.h
//  CookBooks
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"
#import "LoginController.h"

@interface MyVC : UIViewController<UIImagePickerControllerDelegate>

@property (nonatomic,strong)LoginView *loginView;

@property (nonatomic,strong)LoginController *loginController;

@end
