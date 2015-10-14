//
//  SmallClassesifyModel.h
//  CookBooks
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SmallClassesifyModel : NSObject

// 菜名的id
@property (nonatomic,strong) NSString *ID;
// 菜名
@property (nonatomic,strong) NSString *name;
// 小分类所需拼接的id
@property (nonatomic,strong) NSString *typeID;
// 类名
@property (nonatomic,strong) NSString *typeName;
// POST拼接需要
@property (nonatomic,strong) NSString *tagid;


@end
