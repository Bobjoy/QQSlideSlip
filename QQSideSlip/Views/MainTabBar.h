//
//  MyNBTabBar.h
//  NB2
//
//  Created by kohn on 13-11-16.
//  Copyright (c) 2013年 Kohn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "MainTabBar.h"

@class MainTabController;
@class MainTabButton;
@protocol MainTabBarDelegate <NSObject>

@optional
- (void)switchViewController:(MainTabController *)viewController;

- (void)tabBar:(MainTabButton *)tabBarButton;

@end


@interface MainTabBar : UIView
@property (nonatomic,assign)id<MainTabBarDelegate> delegate;


- (id)initWithItems:(NSArray *)items;

//- (void)showDefauls;
//- (void)showIndex:(NSInteger)index;

- (void)touchDownForButton:(UIButton *)button;
- (void)touchUpForButton:(UIButton *)button;

-(void)headImage:(UIImage *)image;

@end
