//
//  ClassesifyHelpers.h
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassesifyHelpers : NSObject

// 存取解析出来的全部数组
@property (nonatomic,strong) NSMutableArray *mutArray;
// 点击每个事件需要的id
@property (nonatomic,strong) NSString *ID;

// 单例
+ (ClassesifyHelpers *)classesifyShare;

// 解析
- (void)getUrl:(void (^)())resultBlock;

@end
