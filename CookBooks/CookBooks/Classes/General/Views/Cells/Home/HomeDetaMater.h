//
//  HomeDetaMater.h
//  CookBooks
//
//  Created by lanou3g on 15/10/12.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeDetaMater : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic,strong) HomeModel * model;
@end
