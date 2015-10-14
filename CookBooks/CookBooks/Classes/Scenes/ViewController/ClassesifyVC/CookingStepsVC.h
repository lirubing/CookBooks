//
//  CookingStepsVC.h
//  CookBooks
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CookingStepsVC : UITableViewController


// 区头传值
@property(nonatomic,strong)NSString *urlstr;
// 材料
@property (nonatomic,strong) NSMutableArray *nameArray;
// 步骤
@property (nonatomic,strong) NSMutableArray *stepArrar;

@property(nonatomic,assign)NSInteger name;
@property(nonatomic,assign)NSInteger step;
@property (nonatomic,strong) NSString *imgUrl;
@end
