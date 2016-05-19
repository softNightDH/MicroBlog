//
//  MainViewController.m
//  DHMicroBlog
//
//  Created by DanielHe on 5/19/16.
//  Copyright © 2016 DanielHe. All rights reserved.
//

#import "MainViewController.h"
#import "HomeTableViewController.h"
#import "MessageTableViewController.h"
#import "DiscoverTableViewController.h"
#import "ProfileTableViewController.h"
#import "MainTabBar.h"

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MainTabBar * tabBar = [[MainTabBar alloc] init];
    
    [self setValue:tabBar forKey:@"tabBar"];
    
    [self addChildViewControllers];
}

- (void)addChildViewControllers
{
    HomeTableViewController *homeVC = [[HomeTableViewController alloc] init];
    [self addChildController:homeVC title:@"首页" imageName:@"tabbar_home"];
    
    MessageTableViewController *messageVC = [[MessageTableViewController alloc] init];
    [self addChildController:messageVC title:@"消息" imageName:@"tabbar_message_center"];
    
    DiscoverTableViewController *discoverVC = [[DiscoverTableViewController alloc] init];
    [self addChildController:discoverVC title:@"发现" imageName:@"tabbar_discover"];
    
    ProfileTableViewController *profileVC = [[ProfileTableViewController alloc] init];
    [self addChildController:profileVC title:@"我" imageName:@"tabbar_profile"];
}

- (void)addChildController: (UIViewController *)vc title: (NSString *)title imageName: (NSString *)imageName
{
    //vc直接设置tabBarItem?
    vc.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", imageName]];
    
    self.tabBar.tintColor = [UIColor orangeColor];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}

@end
