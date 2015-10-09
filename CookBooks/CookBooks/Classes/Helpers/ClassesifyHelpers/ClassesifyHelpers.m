//
//  ClassesifyHelpers.m
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "ClassesifyHelpers.h"
#import "AFHTTPRequestOperationManager.h"
#import "ClassesifyModel.h"

@implementation ClassesifyHelpers

// 单例
+ (ClassesifyHelpers *)classesifyShare
{
    static ClassesifyHelpers *classesifyHelpers = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        classesifyHelpers = [ClassesifyHelpers new];
    });
    return classesifyHelpers;
}

// 解析
- (void)getUrl:(void (^)())resultBlock
{
    NSString *string = @"http://www.ecook.cn/public/selectRecipeHome.shtml";
    NSDictionary *dic = @{@"machine":@"Oc1cd5a9eb17e5574e491e1affb90b93a74da9efb",@"vession":@"11.0.3.1"};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:string parameters:dic success:^void(AFHTTPRequestOperation * task, id result) {
        
        NSArray *arr = result[@"list"];
        for (NSDictionary *dic in arr) {
            ClassesifyModel *model=[ClassesifyModel new];
            [model setValuesForKeysWithDictionary:dic];
            self.ID = model.typeID;
            // 存取解析出来的全部的model
            [self.mutArray addObject:model];
        }
        
        // 调用
        resultBlock();
        
    } failure:^void(AFHTTPRequestOperation * task, NSError * error) {
        NSLog(@"Error: %@", error);
    }];
}




// 懒加载
- (NSMutableArray *)mutArray
{
    if (_mutArray == nil) {
        _mutArray = [NSMutableArray new];
    }
    return _mutArray;
}


@end
