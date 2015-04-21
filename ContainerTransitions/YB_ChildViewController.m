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
     * IOS 7 给出的6
     */
    self.privateTitleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 私有方法
-(void)_updateAppearance{
    if([self isViewLoaded]){
        self.privateTitleLabel.text = self.title;
        self.view.backgroundColor = self.themeColor;
        self.view.tintColor = self.themeColor;
    }
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