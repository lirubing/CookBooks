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
   
    if ([key isEqualToString:@"id"]) {
        self.ID=value;
    }
    if ([key isEqualToString:@"typeid"]) {
        self.typeID=value;
    }
    if ([key isEqualToString:@"typename"]) {
        self.typeName=(NSString*)value;
    }
}



@end
