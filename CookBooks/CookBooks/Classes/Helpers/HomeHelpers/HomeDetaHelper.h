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

@end
