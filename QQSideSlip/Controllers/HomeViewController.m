//
//  HomeViewController.m
//  AugsVetechB2G
//
//  Created by Vetech on 15/10/5.
//  Copyright (c) 2015年 zhangcheng. All rights reserved.
//
//  主页：包括头部轮播、中部TableView、底部TabBar

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupViews {
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
