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

@property (nonatomic,strong) UILabel *nameLabel;
- (void)setSmallModel:(SmallClassesifyModel *)smallModel;
@end
