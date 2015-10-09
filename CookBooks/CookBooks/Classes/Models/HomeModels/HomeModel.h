//
//  HomeModel.h
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject
//轮播图
@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * image;

//小标签
@property (nonatomic,strong) NSString * text;
@property (nonatomic,strong) NSString * id_home;
@property (nonatomic,assign) NSInteger  type;
@property (nonatomic,strong) NSString * order;
@property (nonatomic,strong) NSString * description_home;
@property (nonatomic,strong) NSString * video;
@property (nonatomic,strong) NSString * play;
@property (nonatomic,strong) NSString * favorite;
@property (nonatomic,strong) NSString * create_date;
@property (nonatomic,strong) NSString * content;
@property (nonatomic,strong) NSString * dishes_id;


@end
