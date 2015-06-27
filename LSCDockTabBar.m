//
//  LSCDockTabBar.m
//  QQZoneDemo
//
//  Created by 兜麦 on 15/6/26.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCDockTabBar.h"
#import "LSCDockTabBarButton.h"

@interface LSCDockTabBar ()

@property (nonatomic, weak) LSCDockTabBarButton *selectedButton;

@end

@implementation LSCDockTabBar

- (void)cancelSelected
{
    self.selectedButton.selected = NO;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupTabBarButtonWithIcon:@"tab_bar_feed_icon" title:@"全部动态"];
        [self setupTabBarButtonWithIcon:@"tab_bar_passive_feed_icon" title:@"与我相关"];
        [self setupTabBarButtonWithIcon:@"tab_bar_pic_wall_icon" title:@"照片墙"];
        [self setupTabBarButtonWithIcon:@"tab_bar_e_album_icon" title:@"电子相框"];
        [self setupTabBarButtonWithIcon:@"tab_bar_friend_icon" title:@"好友"];
        [self setupTabBarButtonWithIcon:@"tab_bar_e_more_icon" title:@"更多"];
    }
    return self;
}


- (void)setupTabBarButtonWithIcon:(NSString *)icon title:(NSString *)title
{
    LSCDockTabBarButton *button = [[LSCDockTabBarButton alloc] init];
    button.tag = self.subviews.count;
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage changeImageSize:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
}

- (void)buttonClick:(LSCDockTabBarButton *)button
{
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)])
    {
        [self.delegate tabBar:self didSelectButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
}

- (void)rotation:(BOOL)lanscape
{
    NSInteger count = self.subviews.count;
    self.width = self.superview.width;
    self.height = LSCDockBottomMenuH * count;
    
    for (int i = 0; i < count; i++)
    {
        LSCDockTabBarButton *button = self.subviews[i];
        button.width = self.width;
        button.height = LSCDockBottomMenuH;
        button.x = 0;
        button.y = i * button.height;

    }
}

@end
