//
//  LSCDockTabBarButton.m
//  QQZoneDemo
//
//  Created by 兜麦 on 15/6/26.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCDockTabBarButton.h"
#define LSCTabBarButtonImageLanscpaeWRatio 0.4

@implementation LSCDockTabBarButton


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:20];
    }
    return self;
}


- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (self.width > LSCDockBottomMenuLanscapeW)
    {
        CGFloat imageW = self.width * LSCTabBarButtonImageLanscpaeWRatio;
        CGFloat imageH = self.height;
        return  CGRectMake(0, 0, imageW, imageH);
    }else
    {
        return self.bounds;
    }
}



- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    if (self.width > LSCDockBottomMenuLanscapeW)
    {
        CGFloat titleX = self.width * LSCTabBarButtonImageLanscpaeWRatio;
        CGFloat titleW = self.width - titleX;
        CGFloat titleH = self.height;
        return CGRectMake(titleX, 0, titleW, titleH);
    }else{
        return CGRectZero;
    }
}


- (void)setHighlighted:(BOOL)highlighted
{
}



@end
