//
//  YB_ChildViewController.m
//  ContainerTransitions
//
//  Created by zhangbobo on 15-4-21.
//  Copyright (c) 2015年 zhangbobo. All rights reserved.
//

#import "YB_ChildViewController.h"

@interface YB_ChildViewController ()

@end

@implementation YB_ChildViewController
//设置title
-(void)setTitle:(NSString *)title{
    
    super.title = title;
    [self _updateAppearance];
}
//设置颜色
-(void)setThemeColor:(UIColor *)themeColor{
    _themeColor = themeColor;
    [self _updateAppearance];
}
//配置
-(void)loadView{
    self.privateTitleLabel = [[UILabel alloc]init];
    self.privateTitleLabel.backgroundColor = [UIColor clearColor];
    
    /**
     * IOS 7 给出的6种字体样式
     * UIFontTextStyleHeadline(其中一种)
     */
    self.privateTitleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    self.privateTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.privateTitleLabel.numberOfLines = 0;
    [self.privateTitleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.view = [[UIView alloc]init];
    [self.view addSubview:self.privateTitleLabel];
    
    //添加视图标签
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.privateTitleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.6f constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.privateTitleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.privateTitleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    

    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.privateTitleLabel.text = self.title;
    [self _updateAppearance];
    //添加通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(_contentSizeCategoryDidChangeWithNotification:) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

#pragma mark - 私有方法
-(void)_updateAppearance{
    if([self isViewLoaded]){
        self.privateTitleLabel.text = self.title;
        self.view.backgroundColor = self.themeColor;
        self.view.tintColor = self.themeColor;
    }
}
-(void)_contentSizeCategoryDidChangeWithNotification:(NSNotification*)notification
{
    self.privateTitleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [self.privateTitleLabel invalidateIntrinsicContentSize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
