//
//  HomeModel.m
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

//KVC异常处理
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
    if ([key isEqualToString:@"description"]) {
        self.description_home = value;
    }
    
    if ([key isEqualToString:@"id"]) {
        self.id_home = value;
    }
    
    
}




- (NSString *)description
{
    return [NSString stringWithFormat:@"%@  ,%@ --- %@,  ++++%@", _title,_text,_image,_total];
}
@end
