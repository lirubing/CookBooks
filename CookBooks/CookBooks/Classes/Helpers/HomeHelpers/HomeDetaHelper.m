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
@property (nonatomic,strong) NSMutableArray * arrC;
@property (nonatomic,strong) NSMutableArray * arrC2;
@property (nonatomic,strong) NSMutableArray * arrKnow;
@property (nonatomic,strong) NSMutableArray * arrKey;
@property (nonatomic,strong) NSMutableArray * arrValue;


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
        
        NSDictionary *dicAll = [reslut objectForKey:@"data"];
    
        //做法

        self.arrD = nil;
        NSArray *arrDoing = [dicAll objectForKey:@"step"];
        for (NSDictionary *d in arrDoing) {
            HomeModel *model = [HomeModel new];
            [model setValuesForKeysWithDictionary:d];
            [self.arrD addObject:model];
        }
        
        
        //材料准备
        for (NSDictionary *d2 in [dicAll objectForKey:@"material"]) {
            HomeModel *model = [HomeModel new];
            [model setValuesForKeysWithDictionary:dicAll];
            [model setValuesForKeysWithDictionary:d2];
            [self.arrC addObject:model];
            self.material_image = model.material_image;
        }
        for (NSDictionary *d3 in [dicAll objectForKey:@"spices"]) {
            HomeModel *model = [HomeModel new];
            [model setValuesForKeysWithDictionary:d3];
            [self.arrC2 addObject:model];
        }
        
        
        if ([methodName isEqualToString:@"DishesCommensense"]) {
            //相关常识
            HomeModel *model = [HomeModel new];
            [model setValuesForKeysWithDictionary:dicAll];
            [self.arrKnow addObject:model];
            self.imgKnow = model.image;
            
        }
        
        if ([methodName isEqualToString:@"DishesSuitable"]) {

        //相宜相克
        NSDictionary *dicRelation = [dicAll objectForKey:@"material"];
        self.imgRelation = [dicRelation objectForKey:@"image"];
        for (NSString *key in dicRelation) {
            if ([key isEqualToString:@"suitable_with"] || [key isEqualToString:@"suitable_not_with"] ) {
                [self.arrKey addObject:dicRelation[key]];
                HomeModel *model = [HomeModel new];
                [model setValuesForKeysWithDictionary:dicRelation[key]];
                [self.arrValue addObject:model];
            }
        }
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

//材料准备
- (NSMutableArray *)arrC{
    if (_arrC == nil) {
        _arrC = [NSMutableArray array];
    }
    return _arrC;
}

- (NSArray *)arrayMaterial{
    return [_arrC mutableCopy];
}

- (NSMutableArray *)arrC2{
    if (_arrC2 == nil) {
        _arrC2 = [NSMutableArray array];
    }
    return _arrC2;
}

- (NSArray *)arrayLast{
    return [_arrC2 mutableCopy];
}

//相关常识
- (NSMutableArray *)arrKnow{
    if (_arrKnow == nil) {
        _arrKnow = [NSMutableArray array];
    }
    return _arrKnow;
}


- (NSArray *)arrayKnow{
    return [_arrKnow mutableCopy];
}

//相克相宜
- (NSMutableArray *)arrKey{
    if (_arrKey == nil) {
        _arrKey = [NSMutableArray array];
    }
    return _arrKey;
}

- (NSArray *)arrayRelationKey{
    return [_arrKey mutableCopy];
}

- (NSMutableArray *)arrValue{
    if (_arrValue == nil) {
        _arrValue = [NSMutableArray array];
    }
    return _arrValue;
}

- (NSArray *)arrayRelationValue{
    return [_arrValue mutableCopy];
}

@end
