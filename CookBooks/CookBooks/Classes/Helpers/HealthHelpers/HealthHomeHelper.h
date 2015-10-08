//
//  HealthHomeHelper.h
//  CookBooks
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HealthHomeHelper : NSObject
//存放model的数组
@property (nonatomic, strong) NSMutableDictionary * healthHomeMutDict;

//创建单例
+ (HealthHomeHelper *)shareHelper;


//解析数据
- (void)fetchDataWithUrl:(NSString *)url Block:(void(^)(NSMutableDictionary * healthModelDict))block;
@end
