//
//  HomeHelper.h
//  CookBooks
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeHelper : NSObject

+ (HomeHelper *)shareHomeHelper;

- (void)requestWithHomeFinish:(void (^) ())block;

@end
