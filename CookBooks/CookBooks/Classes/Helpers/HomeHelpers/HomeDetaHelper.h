//
//  HomeDetaHelper.h
//  CookBooks
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeDetaHelper : NSObject
//单例
+ (HomeDetaHelper *)shareWithHomeDeta;

//请求数据
- (void)requestWithHomeDetaHelperID:(NSInteger)dishes_id Name:(NSString *)methodName finish:(void (^)())block;

//做法
@property (nonatomic,strong) NSArray * arrayDoing;

//材料准备
@property (nonatomic,strong) NSArray * arrayMaterial;
@property (nonatomic,strong) NSString * material_image;
@property (nonatomic,strong) NSArray * arrayLast;

//相关常识
@property (nonatomic,strong) NSArray * arrayKnow;
@property (nonatomic,strong) NSString * imgKnow;

//相克相宜
@property (nonatomic,strong) NSArray * arrayRelationKey;
@property (nonatomic,strong) NSArray * arrayRelationValue;
@property (nonatomic,strong) NSString * imgRelation;






@end
