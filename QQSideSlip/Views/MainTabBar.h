//
//  MainTabBar.h
//  QQSideSlip
//
//  Created by Bobjoy on 15/11/10.
//  Copyright © 2015年 BFL. All rights reserved.
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
