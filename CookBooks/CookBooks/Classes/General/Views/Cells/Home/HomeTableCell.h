//
//  HomeTableCell.h
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface HomeTableCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *setImage;
@property (weak, nonatomic) IBOutlet UILabel *setLable;
@property (nonatomic,strong) HomeModel * model;
@end
