//
//  HomeCellTwoTVC.m
//  CookBooks
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeCellTwoTVC.h"
#import "UIImageView+WebCache.h"

@implementation HomeCellTwoTVC


- (void)setModel:(HomeModel *)model{
    
    [self.img4Two sd_setImageWithURL:[NSURL URLWithString:model.image]];
    self.label4TwoName.text = model.title;
    self.label4TwoDes.text = model.description_home;
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}






@end
