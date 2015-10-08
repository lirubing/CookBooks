//
//  HomeHelper.m
//  CookBooks
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeHelper.h"
#import "AFHTTPSessionManager.h"
#import "HomeModel.h"
@interface HomeHelper()

@property (nonatomic,strong) NSMutableArray * mutArray;

@end

@implementation HomeHelper
+ (HomeHelper *)shareHomeHelper{
    static HomeHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [HomeHelper new];
    });
    return helper;
}

- (void)requestWithHomeFinish:(void (^)())block{
    //拼接的数据
    //NSString *str = @"methodName=HomeIndex&user_id=0&version=1.0";
    NSDictionary *dic = @{@"methodName":@"HomeIndex",@"user_id":@"0",@"version":@"1.0"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:kHomeURL parameters:dic success:^void(NSURLSessionDataTask * task, id reslut) {
        NSDictionary *dic = [reslut objectForKey:@"data"];
        NSDictionary*dic1 = [dic objectForKey:@"banner"];
        NSArray *scrollImage = [dic1 objectForKey:@"data"];
        for (NSDictionary *sI in scrollImage) {
            HomeModel *model = [HomeModel new];
            [model setValuesForKeysWithDictionary:sI];
            [self.mutArray addObject:model];
        }
        
        
        NSLog(@"%@",self.mutArray);
        
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        
    }];
    
    
    
}

- (NSMutableArray *)mutArray{
    if (_mutArray == nil) {
        _mutArray = [NSMutableArray array];
    }
    return _mutArray;
}






@end
