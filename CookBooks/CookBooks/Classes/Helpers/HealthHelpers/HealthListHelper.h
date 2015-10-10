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
//总页数
@property (nonatomic, strong) NSNumber * totalpage;
//每页显示的数据
@property (nonatomic, strong) NSNumber * pageSize;

//拼接网址，用于刷新
@property (nonatomic, strong) NSString * refreshListUrl;

//单例
+ (HealthListHelper *)shareHelper;


//解析数据
- (void)fetchDataWithUrl:(NSString *)url Block:(void(^)(NSMutableArray *arr))block refreshBlockPageSize:(void(^)(NSNumber *url))refreshPageSizeBlock refreshBlockTotalPage:(void(^)(NSNumber *totalPage))refreshTotalPageBlock;





@end
