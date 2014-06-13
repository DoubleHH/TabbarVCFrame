//
//  HNTabView.h
//  DemoTabbarVC
//
//  Created by DoubleHH on 14-5-27.
//  Copyright (c) 2014年 doubleHH. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^HNTabViewBlock)(int index);
@interface HNTabView : UIView

- (id)initWithFrame:(CGRect)frame items:(NSArray *)items;
@property (nonatomic, copy) HNTabViewBlock itemPressedBlock;

@end

@interface HNTabItemViewModel : NSObject

@property (nonatomic, strong) NSString *bgImageName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *normalIconName;
@property (nonatomic, strong) NSString *highlightedIconName;
@property (nonatomic, strong) NSString *disableIconName;

@end
