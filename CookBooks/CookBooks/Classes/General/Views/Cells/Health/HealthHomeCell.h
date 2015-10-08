//
//  HealthHomeCell.h
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthHomeCell : UITableViewCell
//标题
@property (weak, nonatomic) IBOutlet UILabel *healthHomeLabel;

//存储传来进行解析model的网址
@property (nonatomic, strong) NSString *urlStr;

@end
