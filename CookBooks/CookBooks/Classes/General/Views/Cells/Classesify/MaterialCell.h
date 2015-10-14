//
//  MaterialCell.h
//  CookBooks
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaterialModel.h"

@interface MaterialCell : UITableViewCell
// 材料名字
@property (weak, nonatomic) IBOutlet UILabel *material;
@property (nonatomic,strong) NSMutableArray *mutArray;
//- (void)setMaterialModel:(MaterialModel *)MaterialModel;

@end
