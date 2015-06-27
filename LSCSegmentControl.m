//
//  LSCSegmentControl.m
//  QQZoneDemo
//
//  Created by 兜麦 on 15/6/27.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCSegmentControl.h"
#import "LSCSegment.h"

@interface LSCSegmentControl ()
@property (nonatomic, assign) LSCSegment *selectedSegment;
@end

@implementation LSCSegmentControl

- (void)setItems:(NSArray *)items
{
    _items = items;
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSUInteger count = items.count;
    for (int i = 0; i < count; i++)
    {
        LSCSegment *segment = [[LSCSegment alloc] init];
        segment.tag = i;
        [segment setTitle:items[i] forState:UIControlStateNormal]
        ;
        NSString *bgName;
        NSString *selectedBgName;
        if (i == 0) {
            bgName = @"SegmentedControl_Left_Normal";
            selectedBgName = @"SegmentedControl_Left_Selected";
        }else if (i == count - 1)
        {
            bgName = @"SegmentedControl_Right_Normal";
            selectedBgName = @"SegmentedControl_Right_Selected";
        }else
        {
            bgName = @"SegmentedControl_Normal";
            selectedBgName = @"SegmentedControl_Selected";
        }
        [segment setBackgroundImage:[UIImage changeImageSize:bgName] forState:UIControlStateNormal];
        [segment setBackgroundImage:[UIImage changeImageSize:selectedBgName] forState:UIControlStateSelected];
        
        [segment addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:segment];
    }
}

- (void)segmentClick:(LSCSegment *)segment
{
    self.selectedSegment.selected = NO;
    segment.selected = YES;
    self.selectedSegment = segment;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count = self.items.count;
    CGFloat segmentW = self.width / count;
    CGFloat segmentH = self.height;
    for (int i = 0; i < count; i++)
    {
        LSCSegment *segment = self.subviews[i];
        segment.width = segmentW;
        segment.height = segmentH;
        segment.y = 0;
        segment.x = i * segmentW;
    }
}


- (void)setSelectedSegmentIndex:(int)selectedSegmentIndex
{
    NSUInteger count = self.items.count;
    if (selectedSegmentIndex < 0 || selectedSegmentIndex >= count) return;
    LSCSegment *segment = self.subviews[selectedSegmentIndex];
    [self segmentClick:segment];
}

- (int)selectedSegmentIndex
{
   return  self.selectedSegment.tag;
}
@end
