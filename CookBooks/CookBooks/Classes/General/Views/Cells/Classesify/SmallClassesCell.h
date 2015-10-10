//
//  SmallClassesCell.h
//  CookBooks
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmallClassesifyModel.h"

@interface SmallClassesCell : UICollectionViewCell

// 菜名
@property (nonatomic,strong) UILabel *nameLabel;
// 传值
- (void)setSmallModel:(SmallClassesifyModel *)smallModel;

@end
