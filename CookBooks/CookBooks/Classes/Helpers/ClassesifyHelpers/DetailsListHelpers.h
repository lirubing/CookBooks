//
//  DetailsListHelpers.h
//  CookBooks
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailsListHelpers : NSObject

// 单例
+ (DetailsListHelpers *)detailsListShare;
// 解析
- (void)getDetailsString:(NSString *)str ListUrl:(void (^)())resultBlock;
// cook界面需要
- (void)getMaterialString:(NSString *)str ListUrl:(void (^)())resultBlock;
// 存放解析出来的model大数组
@property (nonatomic,strong) NSMutableArray *mutArr;
// 存放材料名字的数组
@property (nonatomic,strong) NSMutableArray *nameArr;
// 做菜步骤
@property (nonatomic,strong) NSMutableArray *stepArr;

@end
