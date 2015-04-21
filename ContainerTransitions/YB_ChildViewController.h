//
//  YB_ChildViewController.h
//  ContainerTransitions
//
//  Created by zhangbobo on 15-4-21.
//  Copyright (c) 2015年 zhangbobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YB_ChildViewController : UIViewController
//当实例化视图时,这种颜色将被应用视图的backgroundColor和tintColor。

@property (nonatomic ,strong)UIColor * themeColor;

@property (nonatomic ,strong)UILabel * privateTitleLabel;
@end
