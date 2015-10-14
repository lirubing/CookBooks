//
//  MaterialCell.m
//  CookBooks
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "MaterialCell.h"
#import "MaterialModel.h"

@implementation MaterialCell

//- (void)setMaterialModel:(MaterialModel *)MaterialModel
//{
////    self.material.text = MaterialModel.name;
////    NSArray *arr = DetailsModel.materialList;
////    for (int i = 0; i < arr.count; i++) {
////        NSDictionary *dict = arr[i];
////        [self.mutArray addObject:dict[@"name"]];
////    }
////    for (NSDictionary *dict in arr) {
////        MaterialModel *model = [MaterialModel new];
////        [model setValuesForKeysWithDictionary:dict];
////        [self.mutArray addObject:model];
////    }
//    
//    self.material.text = MaterialModel.name;
//    
//}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
