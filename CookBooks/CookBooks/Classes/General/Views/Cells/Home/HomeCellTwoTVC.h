//
//  HomeCellTwoTVC.h
//  CookBooks
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface HomeCellTwoTVC : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img4Two;

@property (weak, nonatomic) IBOutlet UILabel *label4TwoName;
@property (weak, nonatomic) IBOutlet UILabel *label4TwoDes;

@property (nonatomic,strong) HomeModel * model;

@property (nonatomic,strong) HomeModel * model1;

@end
