//
//  SmallClassesifyModel.m
//  CookBooks
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "SmallClassesifyModel.h"

@implementation SmallClassesifyModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"] && [key isEqualToString:@"typeid"]) {
        self.ID = value;
        self.typeID = value;
    }
}

- (void)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues
{
    self.ID = keyedValues[@"list"][@"id"];
    self.typeID = keyedValues[@"list"][@"typeid"];
    self.name = keyedValues[@"list"][@"name"];
//    self.listArr = keyedValues[@"list"];
    
}

- (NSMutableArray *)listArr
{
    if (_listArr == nil) {
        _listArr = [NSMutableArray new];
    }
    return _listArr;
}

@end
