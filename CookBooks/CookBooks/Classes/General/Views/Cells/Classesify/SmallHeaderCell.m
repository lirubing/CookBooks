//
//  SmallHeaderCell.m
//  CookBooks
//
//  Created by lanou3g on 15/10/12.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "SmallHeaderCell.h"

@implementation SmallHeaderCell

- (void)setSmallModel:(SmallClassesifyModel *)smallModel
{
    if (_smallModel == nil) {
        _smallModel = [SmallClassesifyModel new];
        self.header.text = _smallModel.typeName;
    }
}

- (void)awakeFromNib {
    // Initialization code
}

@end
