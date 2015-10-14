//
//  SmallClassesifyHelpers.m
//  CookBooks
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "SmallClassesifyHelpers.h"
#import "AFHTTPRequestOperationManager.h"
#import "SmallClassesifyModel.h"
#import "ClassesifyHelpers.h"

@interface SmallClassesifyHelpers ()

@end
@implementation SmallClassesifyHelpers

// 单例
+(SmallClassesifyHelpers *)smallClassesifyShare
{
    static SmallClassesifyHelpers *smallClassesifyHelpers = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        smallClassesifyHelpers = [SmallClassesifyHelpers new];
    });
    return smallClassesifyHelpers;
}

// 解析
- (void)getSmallClassesUrl:(void (^)())resultBlock
{
   NSString *url = @"http://www.ecook.cn/public/selectTagsTypeByTypeid.shtml";
   
    NSDictionary *dic = @{@"id":self.urlID,@"machine":@"7e7a5fcaf52bdc3ed872d20690f41cde",@"version":@"11.1.3"};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:dic success:^ void(AFHTTPRequestOperation * task, id result) {
        // 每次点击前先移除之前保存的数据
        [self.mutArr removeAllObjects];
        NSArray *arr = result[@"list"];
        for (NSDictionary *dic in arr) {
            SmallClassesifyModel *model = [SmallClassesifyModel new];
            [model setValuesForKeysWithDictionary:dic];
            [self.mutArr addObject:model];
        }
//        NSLog(@"%@",self.mutArr);
        // 调用
        resultBlock();
    } failure:^ void(AFHTTPRequestOperation * task, NSError * error) {
        NSLog(@"Error: %@",error);
    }];
    
}

// 点击点击每个事件需要的id
- (NSString *)urlID{
    if (_urlID == nil) {
        _urlID = [NSString new];
    }
    return _urlID;
}



// 懒加载
- (NSMutableArray *)mutArr
{
    if (_mutArr == nil) {
        _mutArr = [NSMutableArray new];
    }
    return _mutArr;
}



@end
