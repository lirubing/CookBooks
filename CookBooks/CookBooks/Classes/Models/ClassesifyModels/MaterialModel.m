//
//  MaterialModel.m
//  CookBooks
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "MaterialModel.h"

@implementation MaterialModel
// KVC
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
   
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@==%@", _name,_details];
}


@end
