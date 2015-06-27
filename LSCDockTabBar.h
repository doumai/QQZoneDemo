//
//  LSCDockTabBar.h
//  QQZoneDemo
//
//  Created by 兜麦 on 15/6/26.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LSCDockTabBar;
@protocol LSCDockTabBarDelegate <NSObject>
@optional

- (void)tabBar:(LSCDockTabBar *)tabBar didSelectButtonFrom:(NSInteger)from to:(NSInteger)to;
@end


@interface LSCDockTabBar : UIView

- (void)rotation:(BOOL)lanscape;
- (void)cancelSelected;
@property (nonatomic, weak) id <LSCDockTabBarDelegate> delegate;


@end
