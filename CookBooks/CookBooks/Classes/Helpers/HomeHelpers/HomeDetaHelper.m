//
//  HomeDetaHelper.m
//  CookBooks
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeDetaHelper.h"
#import "HomeModel.h"
@interface HomeDetaHelper()
@property (nonatomic,strong) NSMutableArray * arrD;
@property (nonatomic,strong) NSDictionary * dic;
@end
@implementation HomeDetaHelper
+ (HomeDetaHelper *)shareWithHomeDeta{
    static HomeDetaHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [HomeDetaHelper new];
    });
    return helper;
}


- (void)requestWithHomeDetaHelperID:(NSInteger)dishes_id Name:(NSString *)methodName finish:(void (^)())block{
    
    NSNumber *num = [NSNumber numberWithInteger:dishes_id];
    
    self.dic = @{@"dishes_id":num,@"methodName":methodName,@"version":@"1.0"};
    
    if ([methodName isEqualToString:@"DishesView"]) {
        self.dic = @{@"dishes_id":num,@"methodName":methodName,@"user_id":@"0",@"version":@"1.0"};
    }
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:kHomeURL parameters:self.dic success:^void(NSURLSessionDataTask * task, id reslut) {
        NSLog(@"=====%@",reslut);
        [self.arrD removeAllObjects];
        NSDictionary *dicAll = [reslut objectForKey:@"data"];
        //做法
        NSArray *arrDoing = [dicAll objectForKey:@"step"];
        for (NSDictionary *d in arrDoing) {
            HomeModel *model = [HomeModel new];
            [model setValuesForKeysWithDictionary:d];
            [self.arrD addObject:model];
            
        }
        
        
        block();
    } failure:^ void(NSURLSessionDataTask * task, NSError * error) {
        NSLog(@"%@",error);
    }];
    

    
}


#pragma mark ------lazy------
- (NSMutableArray *)arrD{
    if (_arrD == nil) {
        _arrD = [NSMutableArray array];
    }
    return _arrD;
}


- (NSArray *)arrayDoing{
    return [_arrD mutableCopy];
}







@end
