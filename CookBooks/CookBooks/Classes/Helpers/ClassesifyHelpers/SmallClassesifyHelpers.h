//
//  SmallClassesifyHelpers.h
//  CookBooks
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SmallClassesifyHelpers : NSObject
// 单例
+(SmallClassesifyHelpers *)smallClassesifyShare;
// 解析
- (void)getSmallClassesUrl:(void (^)())resultBlock;
// 点击点击每个事件需要的id
@property (nonatomic, strong)NSString *urlID;
// 解析存入数组
@property (nonatomic,strong) NSMutableArray *mutArr;


@end
