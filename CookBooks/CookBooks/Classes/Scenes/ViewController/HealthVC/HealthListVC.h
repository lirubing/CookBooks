//
//  HealthListVC.h
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthListVC : UIViewController

//存储解析后传来的model数组
@property (nonatomic, strong) NSMutableArray * healthListeArr;

//存储传来进行解析model的网址
@property (nonatomic, strong) NSString *urlStr;

//🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇
//存储拼接后刷新的网址
@property (nonatomic, strong) NSNumber * refreshUrlStrPageSize;
//存储总的页数
@property (nonatomic, strong) NSNumber * refreshUrlTotalPage;
//存储已经加载的数据
@property (nonatomic, strong) NSMutableArray * didLoadArr;
 //🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇🍇

@end
