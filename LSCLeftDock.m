//
//  LSCLeftDock.m
//  QQZoneDemo
//
//  Created by 兜麦 on 15/6/26.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCLeftDock.h"
#import "LSCDockIconButton.h"
#import "LSCDockTabBar.h"
#import "LSCDockBottomMenu.h"

@interface LSCLeftDock ()


@end


@implementation LSCLeftDock

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupIconButton];
        [self setupTabBar];
        [self setupBottomMenu];
    }
    return self;
}

- (void)setupIconButton
{
    LSCDockIconButton *iconButton = [[LSCDockIconButton alloc] init];
    [self addSubview:iconButton];
    _iconButton = iconButton;
}

- (void)setupTabBar
{
    LSCDockTabBar *tabBar = [[LSCDockTabBar alloc] init];
    tabBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self addSubview:tabBar];
    _tabBar = tabBar;
}

- (void)setupBottomMenu
{
    LSCDockBottomMenu *bottomMenu = [[LSCDockBottomMenu alloc] init];
    [self addSubview:bottomMenu];
    bottomMenu.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    _bottomMenu = bottomMenu;
}


- (void)rotation:(BOOL)lanscape
{

    [self.bottomMenu rotation:lanscape];
    
    self.width = self.bottomMenu.width;
    
    [self.tabBar rotation:lanscape];
    self.tabBar.y = self.bottomMenu.y - self.tabBar.height;
    
    [self.iconButton rotation:lanscape];

    
}

@end
