//
//  LSCContentViewController.m
//  QQZoneDemo
//
//  Created by 兜麦 on 15/6/27.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCContentViewController.h"

@interface LSCContentViewController ()

@end

@implementation LSCContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发表日志";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(close)];
   self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:nil action:nil];
}

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
