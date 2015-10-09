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
- (void)getDetailsListUrl:(void (^)())resultBlock;
// 存放解析出来的model数组
@property (nonatomic,strong) NSMutableArray *mutArr;
@property (nonatomic,strong) NSString *idUrl;

@end
