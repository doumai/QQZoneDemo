//
//  LSCDockIconButton.m
//  QQZoneDemo
//
//  Created by 兜麦 on 15/6/26.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCDockIconButton.h"

@implementation LSCDockIconButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setTitle:@"兜麦" forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"lufie.jpg"] forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.layer.cornerRadius = 10;
        
    }
    return self;
}


- (void)rotation:(BOOL)lanscape
{
    if (lanscape)
    {
        self.width = self.superview.width * 0.35;
        self.height = self.width + 30;
        self.y = 60;
        self.x = (self.superview.width - self.width) * 0.5;
    }else
    {
        self.y = 40;
        self.x = 10;
        self.width = self.superview.width - 2 * self.x;
        self.height = self.width;
    }
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (self.width > LSCDockBottomMenuPortraitW)
    {
        CGFloat imageW = self.width;
        CGFloat imageH = imageW;
        return  CGRectMake(0, 0, imageW, imageH);
    }else
    {
        return self.bounds;
    }
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    if (self.width > LSCDockBottomMenuPortraitW)
    {
        CGFloat titleY = self.width;
        CGFloat titleW = self.width;
        CGFloat titleH = self.height - titleY;
        return CGRectMake(0, titleY, titleW, titleH);
        
    }else
    {
        return CGRectZero;
    }
}

@end
