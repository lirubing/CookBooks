//
//  DetailsListCell.h
//  CookBooks
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsListModel.h"

@interface DetailsListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *dishImg;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *details;

- (void)setDetalisModel:(DetailsListModel *)detailsModel;

@end
