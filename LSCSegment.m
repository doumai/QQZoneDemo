//
//  LSCSegment.m
//  QQZoneDemo
//
//  Created by 兜麦 on 15/6/27.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCSegment.h"

@implementation LSCSegment

- (void)setHighlighted:(BOOL)highlighted
{
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

@end
