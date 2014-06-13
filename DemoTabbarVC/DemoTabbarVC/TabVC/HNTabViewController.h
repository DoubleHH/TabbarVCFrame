//
//  HNTabViewController.h
//  DemoTabbarVC
//
//  Created by DoubleHH on 14-5-27.
//  Copyright (c) 2014年 doubleHH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HNTabView.h"
#import "HNTabDefines.h"


@interface HNTabModel : NSObject

@property (nonatomic, strong) NSString *viewControllerClassName;
@property (nonatomic, strong) HNTabItemViewModel *tabItemModel;

@end

@interface HNTabViewController : UIViewController

- (id)initWithModels:(NSArray *)models;
@property (nonatomic, assign) int currentIndex;

@end
