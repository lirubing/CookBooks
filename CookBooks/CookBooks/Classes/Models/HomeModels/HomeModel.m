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
    NSLog(@"%@",key);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@   --- %@", _title,_image];
}
@end
