//
//  HNBasicViewController.m
//  DemoTabbarVC
//
//  Created by DoubleHH on 14-5-29.
//  Copyright (c) 2014年 doubleHH. All rights reserved.
//

#import "HNTabItemBasicViewController.h"
#import "HNTabDefines.h"

@interface HNTabItemBasicViewController ()

@end

@implementation HNTabItemBasicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    [super loadView];
    self.view.frame = TabViewControllerContentRect;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
