//
//  HealthListVC.h
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthListVC : UIViewController

//存储传来的model数组
@property (nonatomic, strong) NSArray * healthListeArr;

//存储传来进行解析model的网址
@property (nonatomic, strong) NSString *urlStr;

@end
