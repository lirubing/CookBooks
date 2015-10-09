//
//  ClassesifyModel.h
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassesifyModel : NSObject

// name的id
@property (nonatomic,strong) NSString *ID;
// 名字
@property (nonatomic,strong) NSString *name;
// 小分类所需拼接的id
@property (nonatomic,strong) NSString *typeID;
// 存放大分类的数组(除了区头的数组)
@property (nonatomic,strong) NSMutableArray *listArr;

@end
