//
//  AppDelegate.m
//  XGMCustomTabbar
//
//  Created by xgm on 17/2/10.
//  Copyright © 2017年 www.auratech.hk. All rights reserved.
//

#import "AppDelegate.h"
#import "XGMTabBarViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>
@property (nonatomic,strong)XGMTabBarViewController *xgmTabBarViewController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.xgmTabBarViewController = [[XGMTabBarViewController alloc]init];
    self.xgmTabBarViewController.delegate = self;
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = self.xgmTabBarViewController;
    self.xgmTabBarViewController.selectedViewController.tabBarItem.title = @"";
    NSLog(@"选中的index是%ld",self.xgmTabBarViewController.selectedIndex);
    
    
    for (int i = 0; i<self.xgmTabBarViewController.customSelectViews.count;i++) {
        UIImageView *imageView = [self.xgmTabBarViewController.customSelectViews objectAtIndex:i];
        if (i == self.xgmTabBarViewController.selectedIndex) {
            imageView.hidden = NO;
        }else {
            imageView.hidden = YES;
        }
    }
    
     [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark -UITabBarControllerDelegate
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    //文本隐藏
    [tabBarController.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (idx) {
            case 0:{
             obj.tabBarItem.title = @"录音";
            }
                break;
            case 1:{
                obj.tabBarItem.title=@"视频";
            }
                break;
            case 2:{
                obj.tabBarItem.enabled = NO;
                obj.tabBarItem.title=@"";
            }
                break;
            case 3:{
                obj.tabBarItem.title=@"记事本";
                
            } break;
            case 4:{
                
                obj.tabBarItem.title=@"声音";
                
            } break;
            default:
                break;
        }
    }];
    
    viewController.tabBarItem.title = @"";
    
    //隐藏下面的半圆图标
    for (int i = 0; i<self.xgmTabBarViewController.customSelectViews.count;i++) {
        UIImageView *imageView = [self.xgmTabBarViewController.customSelectViews objectAtIndex:i];
        if (i == self.xgmTabBarViewController.selectedIndex) {
            imageView.hidden = NO;
        }else {
            imageView.hidden = YES;
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
