//
//  DetailsListCell.m
//  CookBooks
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "DetailsListCell.h"

@implementation DetailsListCell

- (void)setDetalisModel:(DetailsListModel *)detailsModel
{
    self.title.text = detailsModel.name;
    self.details.text = detailsModel.content;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
