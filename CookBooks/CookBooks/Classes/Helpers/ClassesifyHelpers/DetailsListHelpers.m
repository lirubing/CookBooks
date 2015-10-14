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
#import "CookingStepsVC.h"
#import "UIImageView+WebCache.h"
#import "MaterialModel.h"

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

- (void)getDetailsString:(NSString *)str ListUrl:(void (^)())resultBlock{
    NSString *url = @"http://www.ecook.cn/public/selectOneTwoThreeTags.shtml";
    
    
    NSInteger ID = [str integerValue];
    NSNumber *num = [NSNumber numberWithInteger:ID];
    
    NSDictionary *dic = @{@"machine":@"7e7a5fcaf52bdc3ed872d20690f41cde",@"version":@"11.1.3",@"start":@"0",@"tags":num};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:dic success:^ void(AFHTTPRequestOperation * task, id result) {
        // 每次点击前先移除之前保存的数据
        [self.mutArr removeAllObjects];
        NSArray *arr = result[@"list"];
        for (NSDictionary *dict in arr) {
            DetailsListModel *model = [DetailsListModel new];
            [model setValuesForKeysWithDictionary:dict];
            [self.mutArr addObject:model];
            
        }
        
        
        // 材料
        [self.nameArr removeAllObjects];
        for (NSDictionary *dic in [result objectForKey:@"list"]) {
            NSArray *arr = [dic objectForKey:@"materialList"];
            [self.nameArr addObject:arr];
        }
        // 步骤
        [self.stepArr removeAllObjects];
        for (NSDictionary *dic in [result objectForKey:@"list"]) {
            NSArray *arr = [dic objectForKey:@"stepList"];
            [self.stepArr addObject:arr];
        }
        resultBlock();
    } failure:^ void(AFHTTPRequestOperation * task, NSError * error) {
        NSLog(@"Error : %@",error);
    }];
    
    
}

//懒加载
- (NSMutableArray *)nameArr{
    if (_nameArr == nil) {
        _nameArr = [NSMutableArray array];
    }
    return _nameArr;
}

- (NSMutableArray *)stepArr{
    if (_stepArr == nil) {
        _stepArr = [NSMutableArray array];
    }
    return _stepArr;
}






- (NSMutableArray *)mutArr
{
    if (_mutArr == nil) {
        _mutArr = [NSMutableArray new];
    }
    return _mutArr;
}




@end
