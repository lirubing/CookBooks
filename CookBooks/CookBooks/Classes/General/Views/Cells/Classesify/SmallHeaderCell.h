//
//  SmallHeaderCell.h
//  CookBooks
//
//  Created by lanou3g on 15/10/12.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmallClassesifyModel.h"

@interface SmallHeaderCell : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UILabel *header;
@property (nonatomic,strong) SmallClassesifyModel *smallModel;
@end
