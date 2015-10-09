//
//  HomeListHelper.h
//  CookBooks
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeListHelper : NSObject

+ (HomeListHelper *)shareHomeList;

- (void)requestHomeListWithPage:(NSInteger)currentPage id:(NSString *)serial_id finish:(void (^)())block;
@end
