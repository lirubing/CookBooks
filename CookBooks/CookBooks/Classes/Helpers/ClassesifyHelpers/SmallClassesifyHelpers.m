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
   NSString *url = @"http://www.ecook.cn/public/selectTagsTypeSimpleByTypeid.shtml";
   
    NSDictionary *dic = @{@"machine":@"Oc1cd5a9eb17e5574e491e1affb90b93a74da9efb",@"vession":@"11.0.3.1",@"id":self.urlID};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:dic success:^void(AFHTTPRequestOperation * task, id result) {
        
        NSArray *arr = result[@"list"];
//        NSLog(@"%@",arr);
        for (NSDictionary *dic in arr) {
            SmallClassesifyModel *model = [SmallClassesifyModel new];
            [model setValuesForKeysWithDictionary:dic];
            [self.mutArr addObject:model];
        }
        
        NSLog(@"%@",self.mutArr);
        
        
        
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
