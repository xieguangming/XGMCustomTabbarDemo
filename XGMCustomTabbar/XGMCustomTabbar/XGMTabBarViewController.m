//
//  XGMTabBarViewController.m
//  XGMCustomTabbar
//
//  Created by xgm on 17/2/10.
//  Copyright © 2017年 www.auratech.hk. All rights reserved.
//

#import "XGMTabBarViewController.h"
#import "ViewController.h"

@interface XGMTabBarViewController ()

@end

@implementation XGMTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ViewController *viewController0 = [[ViewController alloc] init];
    viewController0.view.backgroundColor = [UIColor redColor];
    
    
    ViewController *viewController1 = [[ViewController alloc] init];
    viewController1.view.backgroundColor = [UIColor grayColor];
    
    
    ViewController *viewController2= [[ViewController alloc] init];
    viewController2.view.backgroundColor = [UIColor blueColor];
    
    
    ViewController *viewController3 = [[ViewController alloc] init];
    viewController3.view.backgroundColor = [UIColor purpleColor];
    
    
    ViewController *viewController4 = [[ViewController alloc] init];
    viewController4.view.backgroundColor = [UIColor greenColor];
    
    self.viewControllers = @[viewController0,viewController1,viewController2,viewController3,viewController4];
    
     [self setupTabBar];
    
    
}

-(void)setupTabBar{

    [UITabBar appearance].translucent = NO;  //取消tabBar的透明效果。
    
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (idx) {
            case 0:{
                obj.tabBarItem.image = [[UIImage imageNamed:@"recording"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"recording"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.title=@"录音";
                
            } break;
            case 1:{
                obj.tabBarItem.image = [[UIImage imageNamed:@"video"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"video"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.title=@"视频";
                
                
            } break;
            case 2:{
                obj.tabBarItem.enabled=NO;
                obj.tabBarItem.title=@"";
                
            } break;
            case 3:{
                obj.tabBarItem.image = [[UIImage imageNamed:@"txt"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"txt"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.title=@"记事本";
                
            } break;
            case 4:{
                obj.tabBarItem.image = [[UIImage imageNamed:@"voice"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"voice"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.title=@"声音";
                
            } break;
                
            default:
                break;
        }
    }];
    
    //修改文字颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[[UIColor blackColor] colorWithAlphaComponent:0.5], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    UIColor *titleHighlightedColor = [UIColor greenColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: titleHighlightedColor, NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];
    
    
    //数组初始化
    self.customSelectViews = [[NSMutableArray alloc]init];
    
    for (UIView *UITabBarButton in self.tabBar.subviews) {
        if ([@"UITabBarButton" isEqualToString:NSStringFromClass([UITabBarButton class])]) {//如果是UITabBarButton
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(UITabBarButton.frame.origin.x+UITabBarButton.frame.size.width/2-5, UITabBarButton.frame.origin.y+UITabBarButton.frame.size.height-5, 10, 5)];
            imageView.image = [UIImage imageNamed:@"main_point"];
            [self.tabBar addSubview:imageView];
            [self.customSelectViews addObject:imageView];
            
            
        }
        
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-37.5 , -15, 75, 75)];
        
        button.layer.cornerRadius = 37.5;
        button.layer.masksToBounds = YES;
        
        [button setBackgroundColor:[UIColor whiteColor]];
        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [button setImage:[UIImage imageNamed:@"camera"] forState:UIControlStateNormal];
        [self.tabBar addSubview:button];
        [self.tabBar bringSubviewToFront:button];
        [button addTarget:self action:@selector(selectImagePicker) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)selectImagePicker {
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相机",@"相册", nil];
    [sheet showInView:self.view];
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
