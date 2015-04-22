//
//  YB_ContainerViewController.h
//  ContainerTransitions
//
//  Created by zhangbobo on 15-4-21.
//  Copyright (c) 2015年 zhangbobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YB_ContainerViewController : UIViewController

//建立一个容器控制器
//The view controllers currently managed by the container view controller.
@property (nonatomic , strong)NSArray * viewControllers;
//当前选中的和可见的子视图控制器
// The currently selected and visible child view controller.
@property (nonatomic , strong)UIViewController * selectedViewController;
//创建按钮的视图的子视图控制器
@property (nonatomic , strong)UIView * privateButtonsView;
//创建子视图的视图控制器的视图
@property (nonatomic , strong)UIView * privateContainerView;

//视图控制器初始化
-(instancetype)initWithViewControllers:(NSArray*)viewControllers;

@end
