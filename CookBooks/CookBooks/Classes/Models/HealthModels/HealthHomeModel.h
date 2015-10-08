//
//  HealthHomeModel.h
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HealthHomeModel : NSObject
//标题
@property (nonatomic, strong) NSString * title;

//点击跳转的详情页网址
@property (nonatomic, strong) NSString * apiurl;
@end
