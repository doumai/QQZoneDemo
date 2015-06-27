//
//  LSCDockBottomMenu.m
//  QQZoneDemo
//
//  Created by 兜麦 on 15/6/26.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCDockBottomMenu.h"

@implementation LSCDockBottomMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupButtonWithIcon:@"tabbar_mood" tag:LSCDockBottomMenuTypeMood];
        [self setupButtonWithIcon:@"tabbar_photo" tag:LSCDockBottomMenuTypePhoto];
        [self setupButtonWithIcon:@"tabbar_blog" tag:LSCDockBottomMenuTypePhoto];
        
    }
    return self;
}

- (void)setupButtonWithIcon:(NSString *)icon tag:(LSCDockBottomMenuType)tag
{
    UIButton *button = [[UIButton alloc] init];
    button.tag = tag;
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage changeImageSize:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
}

- (void)buttonClick:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(buttomMenu:didClickButtonType:)])
    {
        [self.delegate buttomMenu:self didClickButtonType:button.tag];
    }
}




- (void)rotation:(BOOL)lanscape
{
    NSInteger count = self.subviews.count;
    if (lanscape)
    {
        self.width = LSCDockBottomMenuLanscapeW * count;
        self.height = LSCDockBottomMenuH;
        for (int i = 0; i < count; i++)
        {
            UIButton *button = self.subviews[i];
            button.x = i * LSCDockBottomMenuLanscapeW;
            button.y = 0;
            button.width = LSCDockBottomMenuLanscapeW;
            button.height = LSCDockBottomMenuH;
        }
        
    }else
    {
        self.width = LSCDockBottomMenuPortraitW;
        self.height = LSCDockBottomMenuH * count;
        
        for (int i = 0; i < count; i++)
        {
            UIButton *button = self.subviews[i];
            button.x = 0;
            button.y = i * LSCDockBottomMenuH;
            button.width = LSCDockBottomMenuPortraitW;
            button.height = LSCDockBottomMenuH;
        }
    }
    
    self.y = self.superview.height - self.height;
}

@end
