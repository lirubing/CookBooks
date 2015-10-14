//
//  HomeDetaDo.m
//  CookBooks
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeDetaDo.h"

@implementation HomeDetaDo


- (void)setModel:(HomeModel *)model{
    
    [self.img sd_setImageWithURL:[NSURL URLWithString:model.dishes_step_image]];
    self.labelTag.text = [NSString stringWithFormat:@"%@ . ",model.dishes_step_order];
    self.labelText.text = model.dishes_step_desc;
    self.labelText.numberOfLines = 2;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
