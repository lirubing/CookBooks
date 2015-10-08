//
//  HealthListHelper.h
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HealthListHelper : NSObject


//存放model数据的数组
@property (nonatomic, strong) NSMutableArray * healthListMutArr;

//单例
+ (HealthListHelper *)shareHelper;

//解析数据
- (void)fetchDataWithUrl:(NSString *)url Block:(void(^)(NSMutableArray *arr))block;

@end
