//
//  HealthDrawerVC.h
//  CookBooks
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthDrawerVC : UIViewController

//存放接收解析数据传过来的字典
@property (nonatomic, strong) NSDictionary * healthHomeDict;
//接收解析后的用于刷新的字典
@property (nonatomic, strong) NSDictionary * refreshDict;
@end
