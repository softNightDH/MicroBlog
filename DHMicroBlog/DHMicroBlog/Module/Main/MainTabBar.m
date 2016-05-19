//
//  MainTabBar.m
//  DHMicroBlog
//
//  Created by DanielHe on 5/19/16.
//  Copyright © 2016 DanielHe. All rights reserved.
//

#import "MainTabBar.h"

@interface MainTabBar ()

@property (nonatomic, strong) UIButton *plusBtn;
@end

@implementation MainTabBar


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = [UIScreen mainScreen].bounds.size.width / 5;
    CGFloat h = self.bounds.size.height;
    CGRect rect = CGRectMake(0, 0, w, h);
    CGFloat index = 0;
    
    for (UIView *subView in self.subviews) {
        if([subView isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            subView.frame = CGRectOffset(rect, index * w, 0);
            
            index += (index == 1) ? 2 : 1;
        }
    }
    
    [self addSubview:self.plusBtn];
    self.plusBtn.frame = CGRectOffset(rect, 2 * w, 0);
}

#pragma MARK ---------lazy load

- (UIButton *)plusBtn
{
    if(!_plusBtn)
    {
        _plusBtn = [[UIButton alloc] init];
        
        [_plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [_plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [_plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [_plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    }
    
    return _plusBtn;
}
@end
