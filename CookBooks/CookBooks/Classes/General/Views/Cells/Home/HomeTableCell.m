//
//  HomeTableCell.m
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeTableCell.h"
#import "UIImageView+WebCache.h"

@implementation HomeTableCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setModel:(HomeModel *)model{
    
    [self.setImage sd_setImageWithURL:[NSURL URLWithString:model.image]];
    self.setLable.text = model.text;
    self.setLable.font = [UIFont systemFontOfSize:13];
    self.setLable.textAlignment = NSTextAlignmentCenter;
}







@end
