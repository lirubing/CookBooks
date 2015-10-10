//
//  HealthListHelper.m
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HealthListHelper.h"
#import "AFHTTPRequestOperationManager.h"
#import "HealthListerModel.h"

@implementation HealthListHelper

//单例
+ (HealthListHelper *)shareHelper{
    static HealthListHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [HealthListHelper new];
    });
    return helper;
}

//解析数据


- (void)fetchDataWithUrl:(NSString *)url Block:(void (^)(NSMutableArray *))block refreshBlockPageSize:(void (^)(NSNumber *))refreshPageSizeBlock refreshBlockTotalPage:(void (^)(NSNumber *))refreshTotalPageBlock{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:nil success:^ void(AFHTTPRequestOperation *operation, id result) {
        
        //当前抽屉cell的总页数和每页数量
        self.totalpage = result[@"totalpage"];
        self.pageSize = result[@"pagesize"];
        
        //移除先前存放的数据
        [self.healthListMutArr removeAllObjects];
        
        NSArray *array = result[@"results"];
        for (NSDictionary *dict in array) {
            HealthListerModel *model = [HealthListerModel new];
            [model setValuesForKeysWithDictionary:dict];
            [self.healthListMutArr addObject:model];
        }
        
        
        block(self.healthListMutArr);
        
        refreshPageSizeBlock(self.pageSize);
        refreshTotalPageBlock(self.totalpage);
        
        
        
    } failure:^ void(AFHTTPRequestOperation * operation, NSError * result) {
       
    }];
    
    
    
    
}




#pragma mark --lazyload
- (NSMutableArray *)healthListMutArr{
    if (_healthListMutArr == nil) {
        _healthListMutArr = [NSMutableArray array];
    }
    return _healthListMutArr;
}



@end
