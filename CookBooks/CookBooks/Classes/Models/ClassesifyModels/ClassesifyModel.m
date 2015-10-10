//
//  ClassesifyModel.m
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "ClassesifyModel.h"

@implementation ClassesifyModel

// KVC
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(void)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues
{
    self.name = keyedValues[@"tagspo"][@"name"];
    self.ID = keyedValues[@"tagspo"][@"id"];
    self.typeID = keyedValues[@"tagspo"][@"typeid"];
    // 存放(除了区头)的数组
    self.listArr = keyedValues[@"list"];
}
// 打印
- (NSString *)description
{
    return [NSString stringWithFormat:@"%@",self.name];
}

-(NSMutableArray *)listArr
{
    if (_listArr == nil) {
        _listArr = [NSMutableArray new];
    }
    return _listArr;
}


@end
