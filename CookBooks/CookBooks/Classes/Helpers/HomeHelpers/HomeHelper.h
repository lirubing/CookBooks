//
//  HomeHelper.h
//  CookBooks
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeHelper : NSObject

+ (HomeHelper *)shareHomeHelper;

- (void)requestWithHomeFinish:(void (^) ())block;

//轮播图需要图片
@property (nonatomic,strong) NSArray * arrayImg;

//热门数组
@property (nonatomic,strong) NSArray * arrayHot;

//集合视图数据
@property (nonatomic,strong) NSArray * arraySet;

//新品推荐数据
@property (nonatomic,strong) NSArray * arrayNew;

//排行榜
@property (nonatomic,strong) NSArray * arrayRan;

@end
