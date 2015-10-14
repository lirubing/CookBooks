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




- (void)fetchDataWithUrl:(NSString *)url Block:(void (^)(NSMutableArray *))block refreshBlockPageSize:(void (^)(NSNumber *))refreshPageSizeBlock refreshBlockTotalPage:(void (^)(NSNumber *))refreshTotalPageBlock{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:nil success:^ void(AFHTTPRequestOperation *operation, id result) {
        
        self.totalpage = result[@"totalpage"];
        self.pageSize = result[@"pagesize"];
        

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
