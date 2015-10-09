//
//  HomeListHelper.m
//  CookBooks
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeListHelper.h"
#import "HomeModel.h"
@interface HomeListHelper()
@property (nonatomic,strong) NSMutableArray * mutArray;
@end
@implementation HomeListHelper
+ (HomeListHelper *)shareHomeList{
    static HomeListHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [HomeListHelper new];
    });
    return helper;
}

- (void)requestHomeListWithPage:(NSInteger)currentPage id_h:(NSString *)id_home finish:(void (^)())block{
    
    NSNumber *num = [NSNumber numberWithInteger:currentPage];
    NSDictionary *dic = @{@"methodName":@"HomeSerial",@"page":num,@"serial_id":id_home,@"size":@"6",@"user_id":@"0",@"version":@"1.0"};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:kHomeURL parameters:dic success:^void(NSURLSessionDataTask * task, id reslut) {
        [self.mutArray removeAllObjects];
        NSDictionary *dic = [reslut objectForKey:@"data"];
        NSArray *arr = [dic objectForKey:@"data"];
        for (NSDictionary *dic1 in arr) {
            HomeModel *model = [HomeModel new];
            [model setValuesForKeysWithDictionary:dic1];
            [self.mutArray addObject:model];
        }
        
        block();
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
  
    }];
 
    
}

//懒加载
- (NSMutableArray *)mutArray{
    if (_mutArray == nil) {
        _mutArray = [NSMutableArray array];
    }
    return _mutArray;
}

- (NSArray *)array{
    return [_mutArray mutableCopy];
}



@end
