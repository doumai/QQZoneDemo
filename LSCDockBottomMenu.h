//
//  LSCDockBottomMenu.h
//  QQZoneDemo
//
//  Created by 兜麦 on 15/6/26.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    LSCDockBottomMenuTypeMood,
    LSCDockBottomMenuTypePhoto,
    LSCDockBottomMenuTypeBolg
} LSCDockBottomMenuType;

@class LSCDockBottomMenu;
@protocol LSCDockBottomMenuDelegate <NSObject>
@optional
- (void)buttomMenu:(LSCDockBottomMenu *)bottomMenu didClickButtonType:(LSCDockBottomMenuType)buttonType;
@end


@interface LSCDockBottomMenu : UIView
- (void)rotation:(BOOL)lanscape;
@property (nonatomic, weak) id <LSCDockBottomMenuDelegate> delegate;
@end
