//
//  DetailsListModel.h
//  CookBooks
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailsListModel : NSObject

// 菜名
@property (nonatomic,strong) NSString *name;
// 每个菜名对应的id
@property (nonatomic,strong) NSString *ID;
// 材料积步骤
@property (nonatomic,strong) NSString *content;
// 菜谱的作者
@property (nonatomic,strong) NSString *editname;
// 做菜步骤
@property (nonatomic,strong) NSString *details;
// 对做菜步骤的排序
@property (nonatomic,strong) NSString *ordernum;
// 材料
@property (nonatomic,strong) NSArray *materialList;
// 照片的id
@property (nonatomic,strong) NSString *imageid;
// 做菜步骤的字典
@property (nonatomic,strong) NSArray *stepList;

@end
