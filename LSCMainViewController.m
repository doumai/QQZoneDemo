//
//  LSCMainViewController.m
//  QQZoneDemo
//
//  Created by 兜麦 on 15/6/26.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCMainViewController.h"
#import "LSCLeftDock.h"
#import "LSCDockTabBar.h"
#import "LSCDockIconButton.h"
#import "LSCAllStatusViewController.h"
#import "LSCNavigationViewController.h"
#import "LSCDockBottomMenu.h"
#import "LSCContentViewController.h"
#import "LSCMoodViewController.h"
#import "LSCPhotoViewController.h"
@interface LSCMainViewController ()<LSCDockTabBarDelegate,LSCDockBottomMenuDelegate>
@property (nonatomic, strong) LSCLeftDock *dock;
@property (nonatomic, strong) UIView *contentView;
@end

@implementation LSCMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupDock];
    
    [self setupContentView];
    
    [self setupChildlViewControllers];

}

- (void)setupContentView
{
    UIView *contentView = [[UIView alloc] init];
    contentView.height = self.view.height;
    contentView.x = self.dock.width;
    contentView.width = LSCContentView;
    contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:contentView];
    self.contentView = contentView;
}

- (void)setupChildlViewControllers
{
    LSCAllStatusViewController *one = [[LSCAllStatusViewController alloc] init];
//    one.view.backgroundColor = LSCRandomColor;
    [self setupChildViewController:one];
    
    UIViewController *two = [[UIViewController alloc] init];
//    two.view.backgroundColor = LSCRandomColor;
    [self setupChildViewController:two];
    
    UIViewController *three = [[UIViewController alloc] init];
//    three.view.backgroundColor = LSCRandomColor;
      [self setupChildViewController:three];
    
    UIViewController *four = [[UIViewController alloc] init];
//    four.view.backgroundColor = LSCRandomColor;
      [self setupChildViewController:four];
    
    UIViewController *five = [[UIViewController alloc] init];
//    five.view.backgroundColor = LSCRandomColor;
    [self setupChildViewController:five];
    
    UIViewController *six = [[UIViewController alloc] init];
//    six.view.backgroundColor = LSCRandomColor;
    [self setupChildViewController:six];
    
    UIViewController *mine = [[UIViewController alloc] init];
//    mine.view.backgroundColor = LSCRandomColor;
    [self setupChildViewController:mine];
}

- (void)setupChildViewController:(UIViewController *)controller
{
    LSCNavigationViewController *nav = [[LSCNavigationViewController alloc] initWithRootViewController:controller];
    [self addChildViewController:nav];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [UIView animateWithDuration:duration animations:^{
        [self.dock rotation:UIInterfaceOrientationIsLandscape(toInterfaceOrientation)];
        
        self.contentView.x = self.dock.width;
    }];
    
}

- (void)setupDock
{
    
    self.view.backgroundColor = LSCGlobalBgColor;
    
    LSCLeftDock *dock = [[LSCLeftDock alloc] init];
    [self.view addSubview:dock];
    

    dock.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    dock.height = self.view.height;
    
    self.dock = dock;
    
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0.0];
    
    self.dock.tabBar.delegate = self;

    [self.dock.iconButton addTarget:self action:@selector(iconClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.dock.bottomMenu.delegate = self;
}

- (void)buttomMenu:(LSCDockBottomMenu *)bottomMenu didClickButtonType:(LSCDockBottomMenuType)buttonType
{
    switch (buttonType) {
        case LSCDockBottomMenuTypePhoto:
        {
            LSCPhotoViewController *content = [[LSCPhotoViewController alloc] init];
            LSCNavigationViewController *nav = [[LSCNavigationViewController alloc] initWithRootViewController:content];
            nav.modalPresentationStyle = UIModalPresentationFormSheet;
            nav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            [self presentViewController:nav animated:YES completion:nil];
            break;
        }
        case LSCDockBottomMenuTypeMood:
        {
            LSCMoodViewController *content = [[LSCMoodViewController alloc] init];
            LSCNavigationViewController *nav = [[LSCNavigationViewController alloc] initWithRootViewController:content];
            nav.modalPresentationStyle = UIModalPresentationFormSheet;
            nav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            [self presentViewController:nav animated:YES completion:nil];
            break;
        }
        case LSCDockBottomMenuTypeBolg:
        {
            LSCContentViewController *content = [[LSCContentViewController alloc] init];
            LSCNavigationViewController *nav = [[LSCNavigationViewController alloc] initWithRootViewController:content];
            nav.modalPresentationStyle = UIModalPresentationFormSheet;
            nav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            [self presentViewController:nav animated:YES completion:nil];
            break;
        }
        default:
            break;
    }
}

- (void)iconClick
{
    NSInteger count = self.childViewControllers.count;
    int from = 0;
    for (int i = 0; i < count; i++)
    {
        UIViewController *controller = self.childViewControllers[i];
        if (controller.view.superview)
        {
            from = i ;
            break;
        }
    }
    
    int index = count - 1;
    
    [self tabBar:nil didSelectButtonFrom:from to:index];
    
    [self.dock.tabBar cancelSelected];
}

- (void)tabBar:(LSCDockTabBar *)tabBar didSelectButtonFrom:(NSInteger)from to:(NSInteger)to
{
    UIViewController *newController = self.childViewControllers[to];
    if (newController.view.superview) return;
    newController.view.frame = self.contentView.bounds;
    newController.view.backgroundColor = LSCColor(212, 212, 212);
    
    UIViewController *oldController;
    
    UIViewController *lastController = [self.childViewControllers lastObject];
    if (lastController.view.superview)
    {
        oldController = lastController;
    }else
    {
        oldController = self.childViewControllers[from];
    }
  
    if (oldController.view.superview)
    {
        [oldController.view removeFromSuperview];
        [self.contentView addSubview:newController.view];
        
        CATransition *transition = [CATransition animation];
        transition.type = @"rippleEffect";
        transition.duration = 1.0;
        [self.contentView.layer addAnimation:transition forKey:nil];
        
//       [UIView transitionFromView:oldController.view toView:newController.view duration:1.0 options:UIViewAnimationOptionTransitionCurlUp completion:nil];
    }else
    {
        [self.contentView addSubview:newController.view];
    }
 
}

@end
