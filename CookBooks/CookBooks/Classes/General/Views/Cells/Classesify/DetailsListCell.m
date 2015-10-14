//
//  DetailsListCell.m
//  CookBooks
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "DetailsListCell.h"
#import "UIImageView+WebCache.h"
#import "DetailsListModel.h"

@implementation DetailsListCell

- (void)setDetalisModel:(DetailsListModel *)detailsModel
{
    self.title.text = detailsModel.name;
    self.details.text = detailsModel.content;
    // 图片接口拼接
    NSString *imgUrl = [NSString stringWithFormat:kClassesURL,detailsModel.imageid];
    [self.dishImg sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    // 分析数据
    NSArray *arr = detailsModel.materialList;
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:5];
    for (int i = 0; i < arr.count; i++) {
        NSDictionary *dic = arr[i];
        [array addObject:dic[@"name"]];
    }
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
