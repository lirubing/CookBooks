//
//  HomeDetaMaterOC.m
//  CookBooks
//
//  Created by lanou3g on 15/10/12.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeDetaMaterOC.h"

@implementation HomeDetaMaterOC

- (void)setModel:(HomeModel *)model{
    self.labelCooks.text = model.material_name;
    self.labelCooks.numberOfLines = 2;
    self.labelNum.text = model.material_weight;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
