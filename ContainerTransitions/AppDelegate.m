//
//  AppDelegate.m
//  ContainerTransitions
//
//  Created by zhangbobo on 15-4-21.
//  Copyright (c) 2015年 zhangbobo. All rights reserved.
//

#import "AppDelegate.h"
#import "YB_ContainerViewController.h"
#import "YB_ChildViewController.h"

@interface AppDelegate ()
@property (nonatomic , strong)UIWindow * privateWindow;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.privateWindow = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.privateWindow.rootViewController =[self _configuredRootViewController];
    
    [self.privateWindow makeKeyAndVisible];
    return YES;
}
//私有方法 设置启动ViewController
#pragma  mark - Private Methods
-(UIViewController *)_configuredRootViewController
{
    NSArray * childViewControllers = [self _configuredRootViewControllers];
    
    YB_ContainerViewController * rootViewController = [[YB_ContainerViewController alloc]initWithViewControllers:childViewControllers];
    
    return rootViewController;
}

-(NSArray*)_configuredRootViewControllers
{
   
  //设置颜色、标题和标签栏按钮图标ContainerViewController类使用的显示面板的按钮
  NSMutableArray * childViewControllers = [[NSMutableArray alloc]initWithCapacity:3];
    NSArray * configurations = @[
  @{@"title":@"First",@"color":[UIColor colorWithRed:0.4f green:0.8f blue:1 alpha:1]},
  @{@"title": @"Second", @"color": [UIColor colorWithRed:1 green:0.4f blue:0.8f alpha:1]},
  @{@"title": @"Third",@"color": [UIColor colorWithRed:1 green:0.8f blue:0.4f alpha:1]}];
//    NSArray * configurations = @[
//    @{@"title":@"First",@"color":[UIColor orangeColor]},
//    @{@"title": @"Second", @"color": [UIColor greenColor]},
//    @{@"title": @"Third",@"color": [UIColor blueColor]}];

    
    for(NSDictionary * configuration in configurations){
        
        YB_ChildViewController * childViewController = [[YB_ChildViewController alloc] init];
        
        childViewController.title = configuration[@"title"];
        childViewController.themeColor = configuration[@"color"];
        
        childViewController.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",configuration[@"title"]]];
        childViewController.tabBarItem.selectedImage = [UIImage imageNamed:[configuration[@"title"]stringByAppendingString:@" Selected"]];
        
        [childViewControllers addObject:childViewController];
    }
    
    return childViewControllers;
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    
}


@end
