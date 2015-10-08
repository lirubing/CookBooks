//
//  HealthHomeHelper.m
//  CookBooks
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HealthHomeHelper.h"
#import "AFHTTPRequestOperationManager.h"
#import "HealthHomeModel.h"

@implementation HealthHomeHelper
//单例
static HealthHomeHelper *helper = nil;
+ (HealthHomeHelper *)shareHelper{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [HealthHomeHelper new];
    });
    return helper;
}

//解析数据
- (void)fetchDataWithUrl:(NSString *)url Block:(void (^)(NSMutableDictionary *))block{
    
    //请求管理器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    //发起请求
    [manager GET:url parameters:nil success:^void(AFHTTPRequestOperation * operation, id result) {
        
        
        
        NSArray *arr = result;
        for (NSDictionary *dict in arr) {
            //存放区头，作为存放model字典的key值
            NSString *key = dict[@"title"];
            
            //存放value值的数组
            NSMutableArray *valueArr = [NSMutableArray array];
            //存放最里层数据的数组
            NSArray *array = dict[@"items"];
            for (NSDictionary *dic in array) {
                HealthHomeModel *model = [HealthHomeModel new];
                [model setValuesForKeysWithDictionary:dic];
                //存放到数组中
                [valueArr addObject:model];
            }
            
            //将数据存放到字典里
            [self.healthHomeMutDict setValue:valueArr forKey:key];
        }
        
        
        block(self.healthHomeMutDict);
        
        
    } failure:
     ^void(AFHTTPRequestOperation * operation, NSError * error) {
         
         
     }];
    
    
    
}

#pragma mark --lazyload
- (NSMutableDictionary *)healthHomeMutDict{
    if (_healthHomeMutDict == nil) {
        _healthHomeMutDict = [NSMutableDictionary dictionary];
    }
    return _healthHomeMutDict;
}
@end
