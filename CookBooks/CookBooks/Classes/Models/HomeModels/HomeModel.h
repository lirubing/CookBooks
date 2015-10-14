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
@property (nonatomic,strong) NSString * link;
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
@property (nonatomic,strong) NSString * total;
@property (nonatomic,strong) NSString * dashes_name;

//相关常识
@property (nonatomic,strong) NSString * nutrition_analysis;
@property (nonatomic,strong) NSString * production_direction;

//做法页,(步骤数)
@property (nonatomic,strong) NSString * dishes_step_order;
@property (nonatomic,strong) NSString * dishes_step_image;
@property (nonatomic,strong) NSString * dishes_step_desc;

//材料
@property (nonatomic,strong) NSString * material_image;
@property (nonatomic,strong) NSString * material_name;
@property (nonatomic,strong) NSString * material_weight;

//
@property (nonatomic,strong) NSString * suitable_desc;
@end
