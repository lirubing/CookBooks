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
#import "HealthHomeModel.h"



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
- (void)fetchDataWithUrl:(NSString *)url Block:(void (^)(NSMutableArray *))block{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:nil success:^ void(AFHTTPRequestOperation *operation, id result) {
        
        NSArray *array = result[@"results"];
        for (NSDictionary *dict in array) {
             HealthListerModel *model = [HealthListerModel new];
            [model setValuesForKeysWithDictionary:dict];
            [self.healthListMutArr addObject:model];
        }
        
        
        block(self.healthListMutArr);
        
        
        
        
        
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
