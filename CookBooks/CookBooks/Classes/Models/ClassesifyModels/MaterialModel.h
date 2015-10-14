//
//  MaterialModel.h
//  CookBooks
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmallClassesifyModel.h"

@interface MaterialModel : NSObject
// 材料名字
@property (nonatomic,strong) NSString *name;
// 做菜步骤
@property (nonatomic,strong) NSString *details;

@end
