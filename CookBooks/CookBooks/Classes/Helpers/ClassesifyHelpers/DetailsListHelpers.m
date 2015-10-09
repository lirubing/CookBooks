//
//  DetailsListHelpers.m
//  CookBooks
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "DetailsListHelpers.h"
#import "AFHTTPRequestOperationManager.h"
#import "DetailsListModel.h"

@interface DetailsListHelpers ()


@end

@implementation DetailsListHelpers

// 单例
+ (DetailsListHelpers *)detailsListShare
{
    static DetailsListHelpers *detailsListHelpers = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        detailsListHelpers = [DetailsListHelpers new];
    });
    return detailsListHelpers;
}

- (void)getDetailsListUrl:(void (^)())resultBlock
{
    NSString *url = @"http://www.ecook.cn/public/selectOneTwoThreeTags.shtml";
    NSDictionary *dic = @{@"machine":@"Oc1cd5a9eb17e5574e491e1affb90b93a74da9efb",@"vession":@"11.0.3.1",@"start":@"0",@"tags":self.idUrl};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:dic success:^ void(AFHTTPRequestOperation * task, id result) {
        
        NSArray *arr = result[@"list"];
        NSLog(@"%@",arr);
        for (NSMutableDictionary *dict in arr) {
            DetailsListModel *model = [DetailsListModel new];
            [model setValuesForKeysWithDictionary:dict];
            
        }
        
        
        
        
        
        
        
        
        
        resultBlock();
    } failure:^ void(AFHTTPRequestOperation * task, NSError * error) {
        NSLog(@"Error : %@",error);
    }];
    
}











- (NSMutableArray *)mutArr
{
    if (_mutArr == nil) {
        _mutArr = [NSMutableArray new];
    }
    return _mutArr;
}




@end
