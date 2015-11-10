//
//  HomeViewController.m
//  QQSideSlip
//
//  Created by Bobjoy on 15/11/10.
//  Copyright © 2015年 BFL. All rights reserved.
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
