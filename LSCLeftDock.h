//
//  LSCLeftDock.h
//  QQZoneDemo
//
//  Created by 兜麦 on 15/6/26.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LSCDockTabBar;
@class LSCDockIconButton;
@class LSCDockBottomMenu;
@interface LSCLeftDock : UIView
@property (nonatomic, strong,readonly) LSCDockTabBar *tabBar;
@property (nonatomic, strong,readonly) LSCDockIconButton *iconButton;
@property (nonatomic, strong,readonly) LSCDockBottomMenu *bottomMenu;
- (void)rotation:(BOOL)lanscape;
@end
