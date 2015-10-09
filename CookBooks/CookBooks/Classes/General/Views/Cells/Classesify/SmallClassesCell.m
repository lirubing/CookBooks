//
//  SmallClassesCell.m
//  CookBooks
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "SmallClassesCell.h"

@implementation SmallClassesCell

- (void)setSmallModel:(SmallClassesifyModel *)smallModel
{
    self.nameLabel.text = smallModel.name;
    self.nameLabel.frame = CGRectMake(0, 0, 80, 30);
    self.nameLabel.textAlignment = NSTextAlignmentCenter;

}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawView];
    }
    return self;
}

// 绘制SmallCollectionViewCell
- (void)drawView
{
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    [self.contentView addSubview:self.nameLabel];
}


@end
