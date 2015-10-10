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
//轮播
@property (nonatomic,strong) NSMutableArray * mutArray;
//热门
@property (nonatomic,strong) NSMutableArray * hotArray;
//小集合视图
@property (nonatomic,strong) NSMutableArray * smallArray;
//新品推荐
@property (nonatomic,strong) NSMutableArray * nArray;
//排行榜
@property (nonatomic,strong) NSMutableArray * ranArray;


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
        
        [self.mutArray removeAllObjects];
        [self.nArray removeAllObjects];
        [self.ranArray removeAllObjects];
        
        NSDictionary *dic = [reslut objectForKey:@"data"];
        NSDictionary*dic1 = [dic objectForKey:@"banner"];
        NSArray *scrollImage = [dic1 objectForKey:@"data"];
        
        //轮播图
        for (NSDictionary *sI in scrollImage) {
            HomeModel *model = [HomeModel new];
            model.image = [sI objectForKey:@"image"];
            [self.mutArray addObject:model.image];
        }
        
        //热门菜单
        NSArray *hotImag = [dic objectForKey:@"data"];
        NSDictionary *d = hotImag[1];
            for (NSDictionary *h in [d objectForKey:@"data"]) {
                HomeModel *model = [HomeModel new];
                [model setValuesForKeysWithDictionary:h];
                [self.hotArray addObject:model];
            }
        
        //小集合视图
        NSDictionary *sm = [dic objectForKey:@"category"];
        NSArray *smArray = [sm objectForKey:@"data"];
        for (NSDictionary *s in smArray) {
            HomeModel *model = [HomeModel new];
            [model setValuesForKeysWithDictionary:s];
            [self.smallArray addObject:model];
        }
        
        //新品推荐
        NSDictionary *new = [hotImag firstObject];
        for (NSDictionary *n in [new objectForKey:@"data"]) {
            HomeModel *model = [HomeModel new];
            [model setValuesForKeysWithDictionary:n];
            [self.nArray addObject:model];
        }
        
        //排行榜
        NSDictionary *rank = hotImag[2];
        for (NSDictionary *ran in [rank objectForKey:@"data"]) {
            HomeModel *model = [HomeModel new];
            [model setValuesForKeysWithDictionary:ran];
            [self.ranArray addObject:model];
        }
        
            block();
        
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        
    }];
    
    
    
}


//懒加载
//轮播
- (NSMutableArray *)mutArray{
    if (_mutArray == nil) {
        _mutArray = [NSMutableArray array];
    }
    return _mutArray;
}




- (NSArray *)arrayImg{
    return [_mutArray mutableCopy];
}

//热门

- (NSMutableArray *)hotArray{
    if (_hotArray == nil) {
        _hotArray = [NSMutableArray array];
    }
    return _hotArray;
}


- (NSArray *)arrayHot{
    
    return [_hotArray mutableCopy];
}

//小图标

- (NSMutableArray *)smallArray{
    if (_smallArray == nil) {
        _smallArray = [NSMutableArray array];
    }
    return _smallArray;
}



- (NSArray *)arraySet{
    return [_smallArray mutableCopy];
}

//新品推荐

- (NSMutableArray *)nArray{
    if (_nArray == nil) {
        _nArray = [NSMutableArray array];
    }
    return _nArray;
}

- (NSArray *)arrayNew{
    return [_nArray mutableCopy];
}


//排行榜

- (NSMutableArray *)ranArray{
    if (_ranArray == nil) {
        _ranArray = [NSMutableArray array];
    }
    return _ranArray;
}

- (NSArray *)arrayRan{
    return [_ranArray mutableCopy];
}



@end
