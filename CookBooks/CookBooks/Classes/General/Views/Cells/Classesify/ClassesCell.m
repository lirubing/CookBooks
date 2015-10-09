
//
//  ClassesCell.m
//  CookBooks
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "ClassesCell.h"

@implementation ClassesCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawView];
    }
    return self;
}

// 绘制CollectionViewCell
- (void)drawView
{
    self.dishName = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 105, 30)];
    self.dishName.textAlignment = NSTextAlignmentCenter;
    
    [self.contentView addSubview:self.dishName];
}


@end
