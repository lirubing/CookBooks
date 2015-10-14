//
//  HomeKnowCell.m
//  CookBooks
//
//  Created by lanou3g on 15/10/13.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeKnowCell.h"

@implementation HomeKnowCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self drawView];
    }
    return self;
}

- (void)drawView{
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 335, 20)];
    self.label.numberOfLines = 0;
    [self.contentView addSubview:self.label];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
