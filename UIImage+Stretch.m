//
//  UIImage+Stretch.m
//  Created by ShengCheng on 15/5/29.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "UIImage+Stretch.h"

@implementation UIImage (Stretch)
// 图片拉伸
+ (UIImage *)changeImageSize:(NSString *)name
{
    UIImage *imageName = [UIImage imageNamed:name];
    CGFloat w = imageName.size.width * 0.5;
    CGFloat h = imageName.size.height * 0.5;
    return [imageName resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}

@end
