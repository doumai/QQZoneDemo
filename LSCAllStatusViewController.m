//
//  LSCAllStatusViewController.m
//  QQZoneDemo
//
//  Created by 兜麦 on 15/6/27.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCAllStatusViewController.h"
#import "LSCSegmentControl.h"
@interface LSCAllStatusViewController ()

@end

@implementation LSCAllStatusViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *items = @[@"全部",@"特别关心",@"好友动态",@"认证空间"];
    if (iOS7)
    {
        UISegmentedControl *control = [[UISegmentedControl alloc] initWithItems:items];
        control.tintColor = [UIColor grayColor];
        control.frame = CGRectMake(0, 0, 400, 40);
        control.selectedSegmentIndex = 0;
        self.navigationItem.titleView = control;
    }else
    {
        LSCSegmentControl *control = [[LSCSegmentControl alloc] init];
        control.items = items;
        control.frame = CGRectMake(0, 0, 400, 40);
        control.selectedSegmentIndex = 0;
        self.navigationItem.titleView = control;
    }
    

}



@end
