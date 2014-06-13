//
//  HNTabViewController.m
//  DemoTabbarVC
//
//  Created by DoubleHH on 14-5-27.
//  Copyright (c) 2014年 doubleHH. All rights reserved.
//

#import "HNTabViewController.h"

@implementation HNTabModel

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end

@implementation HNTabViewController {
    UIView *mContentView;
    HNTabView *mTabView;
    
    NSArray *mTabModels;
    NSMutableDictionary *mViewControllerDic;
}

- (id)initWithModels:(NSArray *)models {
    self = [super init];
    if (self) {
        mTabModels = models;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)initData {
    _currentIndex = 0;
    mViewControllerDic = [NSMutableDictionary dictionary];
}

- (void)initView {
    
    mContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TabViewHeight)];
    [self.view addSubview:mContentView];
    
    NSMutableArray *itemModels = [NSMutableArray array];
    for (HNTabModel *model in mTabModels) {
        [itemModels addObject:model.tabItemModel];
    }
    mTabView = [[HNTabView alloc] initWithFrame:CGRectMake(0, mContentView.bottom, SCREEN_WIDTH, TabViewHeight) items:itemModels];
    __weak HNTabViewController *wSelf = self;
    mTabView.itemPressedBlock = ^(int index) {
        [wSelf setCurrentIndex:index];
    };
    [self.view addSubview:mTabView];
    
    [self setCurrentIndex:_currentIndex isMoveDirectly:YES];
}

#pragma mark - Index
- (void)setCurrentIndex:(int)currentIndex isMoveDirectly:(BOOL)isMoveDirectly {
    if (currentIndex < 0 || currentIndex >= mTabModels.count) {
        return;
    }
    
    if (isMoveDirectly || (!isMoveDirectly && _currentIndex != currentIndex)) {
        [self moveToShowIndex:currentIndex];
    }
    _currentIndex = currentIndex;
}

- (void)setCurrentIndex:(int)currentIndex {
    NSLog(@"setCurrentIndex : %d", currentIndex);
    [self setCurrentIndex:currentIndex isMoveDirectly:NO];
}

- (void)moveToShowIndex:(int)index {
    
    if (!mContentView || !mTabView) {
        return;
    }
    //先移除mContentView上的Controller, 再添加现在的Controller
    NSArray *subViews = [mContentView subviews];
    for (UIView *subView in subViews) {
        [subView removeFromSuperview];
    }
    
    UIViewController *viewController = [self viewControllerWithIndex:index];
    if (viewController) {
        [mContentView addSubview:viewController.view];
    }
}

- (UIViewController *)viewControllerWithIndex:(int)index {
    UIViewController *viewController = nil;
    HNTabModel *model = [mTabModels objectAtIndex:index];
    id value = [mViewControllerDic valueForKey:model.viewControllerClassName];
    if (value) {
        viewController = value;
    } else {
        viewController = [(UIViewController *)[NSClassFromString(model.viewControllerClassName) alloc] init];
        if (viewController) {
            [mViewControllerDic setValue:viewController forKey:model.viewControllerClassName];
        }
    }
    return viewController;
}

@end
