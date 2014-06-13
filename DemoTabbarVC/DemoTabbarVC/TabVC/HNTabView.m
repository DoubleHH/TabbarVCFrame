//
//  HNTabView.m
//  DemoTabbarVC
//
//  Created by DoubleHH on 14-5-27.
//  Copyright (c) 2014年 doubleHH. All rights reserved.
//

#import "HNTabView.h"

#define ItemTagOffset 1000
#define IntervalBothSide 0.0f
#define IntervalBetweenItems 0.0f

typedef void(^HNTabItemViewBlock)(int index);

@interface HNTabItemView : UIView

@property (nonatomic, assign) int index;

- (id)initWithFrame:(CGRect)frame model:(id)model;
- (void)setSelected:(BOOL)isSelected;
- (BOOL)isSelected;
@property (nonatomic, copy) HNTabItemViewBlock pressedBlock;

@end

@implementation HNTabItemView {
    UIButton *mIconButton;
    UILabel *mTitleLabel;
}

- (id)initWithFrame:(CGRect)frame model:(id)model {
    self = [super initWithFrame:frame];
    if (self) {
        [self initView:model];
    }
    return self;
}

- (void)initView:(id)_model {
    HNTabItemViewModel *model = _model;
    
    float x = 0, y = 0;
    mIconButton = [[UIButton alloc] initWithFrame:CGRectMake(x, y, self.width, self.height)];
    [mIconButton addTarget:self action:@selector(iconButtonPressed:) forControlEvents:UIControlEventTouchDown];
    [mIconButton setImageEdgeInsets:UIEdgeInsetsMake(-10, 0, 0, 0)];
    [self addSubview:mIconButton];
    if (model.bgImageName) {
        [mIconButton setBackgroundImage:[UIImage imageNamed:model.bgImageName] forState:UIControlStateNormal];
    }
    if (model.normalIconName) {
        [mIconButton setImage:[UIImage imageNamed:model.normalIconName] forState:UIControlStateNormal];
    }
    if (model.highlightedIconName) {
        [mIconButton setImage:[UIImage imageNamed:model.highlightedIconName] forState:UIControlStateHighlighted];
    }
    if (model.disableIconName) {
        [mIconButton setImage:[UIImage imageNamed:model.disableIconName] forState:UIControlStateDisabled];
    }
    
    x = 0;
    y = self.height * 2 / 3.0;
    mTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, self.width, 15)];
    mTitleLabel.textColor = [UIColor blackColor];
    mTitleLabel.backgroundColor = [UIColor clearColor];
    mTitleLabel.font = [UIFont systemFontOfSize:12];
    mTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:mTitleLabel];
    
    mTitleLabel.text = model.title;
}

- (void)iconButtonPressed:(UIButton *)button {
    if (self.pressedBlock) {
        self.pressedBlock(self.tag);
    }
}

- (void)setSelected:(BOOL)isSelected {
    mIconButton.enabled = !isSelected;
}

- (BOOL)isSelected {
    return !mIconButton.enabled;
}

@end

@implementation HNTabView {
    int mItemCount;
}

- (id)initWithFrame:(CGRect)frame items:(NSArray *)items
{
    self = [super initWithFrame:frame];
    if (self) {
        mItemCount = 0;
        [self initView:items];
    }
    return self;
}

- (void)initView:(NSArray *)items {
    
    self.backgroundColor = [UIColor whiteColor];
    
    if (!items.count) {
        return;
    }
    mItemCount = items.count;
    
    int count = items.count;
    float itemWidth = (self.width - 2.0 * IntervalBothSide - (count - 1) * IntervalBetweenItems) / count;
    float x = 0, y = 0, width = itemWidth, height = self.height;
    for (int i=0; i<count; ++i) {
        HNTabItemViewModel *model = [items objectAtIndex:i];
        HNTabItemView *itemView = [[HNTabItemView alloc] initWithFrame:CGRectMake(x, y, width, height) model:model];
        itemView.index = i;
        [self addSubview:itemView];
        itemView.tag = ItemTagOffset + i;
        [itemView setSelected:(0 == i)];
        __weak HNTabView *wSelf = self;
        itemView.pressedBlock = ^(int index) {
            [wSelf itemTapped:index];
        };
        
        x += IntervalBetweenItems + itemWidth;
    }
}

- (void)itemTapped:(int)index {
    if (self.itemPressedBlock) {
        self.itemPressedBlock(index - ItemTagOffset);
    }
    for (int i=0; i<mItemCount; ++i) {
        HNTabItemView *itemView = (HNTabItemView *)[self viewWithTag:ItemTagOffset + i];
        [itemView setSelected:i == (index - ItemTagOffset)];
    }
}

@end

@implementation HNTabItemViewModel

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
