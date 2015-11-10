//
//  MenuViewController.h
//  QQSideSlip
//
//  Created by Bobjoy on 15/11/10.
//  Copyright © 2015年 BFL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Menu.h"
#import "Common.h"

@class Menu;
@protocol MenuViewControllerDelegate <NSObject>

@optional
- (void)didSelectHeader;
- (void)didSelectItem:(Menu *)menu;

@end

@interface MenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) id<MenuViewControllerDelegate> delegate;
@property (nonatomic,strong) UIButton *avatarBtn;
@property (nonatomic,strong) NSArray* menus;
@property (nonatomic,strong)UITableView* menuTableView;

- (void)setupViews;

@end
