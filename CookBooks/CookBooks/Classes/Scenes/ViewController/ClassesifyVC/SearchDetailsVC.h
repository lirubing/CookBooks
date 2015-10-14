//
//  SearchDetailsVC.h
//  CookBooks
//
//  Created by lanou3g on 15/10/13.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchDetailsVC : UITableViewController

@property (nonatomic,strong) NSString *imgURL;
@property(nonatomic,assign)NSInteger name;
@property(nonatomic,assign)NSInteger step;

@property (nonatomic,strong) NSMutableArray *nameArr;
@property (nonatomic,strong) NSMutableArray *stepArr;

@end
