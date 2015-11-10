//
//  MenuViewController.h
//  AugsVetechB2G
//
//  Created by Vetech on 15/10/5.
//  Copyright (c) 2015年 doniel. All rights reserved.
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
