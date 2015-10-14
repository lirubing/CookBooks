//
//  HomeDetaMater.m
//  CookBooks
//
//  Created by lanou3g on 15/10/12.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeDetaMater.h"

@implementation HomeDetaMater

- (void)setModel:(HomeModel *)model{
    
    [self.img sd_setImageWithURL:[NSURL URLWithString:model.image]];
    self.label.text = model.title;

    self.label.textColor = [UIColor darkGrayColor];
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
