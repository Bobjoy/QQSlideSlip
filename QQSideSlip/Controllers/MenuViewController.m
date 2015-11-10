//
//  MenuViewController.m
//  QQSideSlip
//
//  Created by Bobjoy on 15/11/10.
//  Copyright © 2015年 BFL. All rights reserved.
//

#import "MenuViewController.h"
#import "MainViewController.h"
#import "Menu.h"

@interface MenuViewController ()
{
    NSArray* menusType;
    UIImageView* avatarImageView;
    NSLayoutConstraint* heightLayoutConstraintOfSettingTableView;
    UILabel * mcLab;
    UILabel * yxLab;
}
@end


@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupViews {
    
    yxLab = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-60, 20, 70, 70)];
    yxLab.layer.cornerRadius = yxLab.bounds.size.width/2;
    yxLab.layer.masksToBounds = YES;
    [yxLab.layer setBorderWidth:1];
    [yxLab.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.view addSubview:yxLab];
    _avatarBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-55, 25, 60, 60)];
    _avatarBtn.layer.cornerRadius = _avatarBtn.bounds.size.width/2;
    _avatarBtn.layer.masksToBounds = YES;
    [_avatarBtn addTarget:self action:@selector(avatarClick) forControlEvents:UIControlEventTouchUpInside];
    [_avatarBtn.layer setBorderWidth:1];
    [_avatarBtn.layer setBorderColor:[UIColor whiteColor].CGColor];
    [_avatarBtn setImage:[UIImage imageNamed:@"knv"] forState:UIControlStateNormal];
    [self.view addSubview:_avatarBtn];
    mcLab = [[UILabel alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH/2-58, 85, 100, 20)];
    mcLab.text = @"旅客中心";
    mcLab.textColor =  [UIColor colorWithRed:24/255.0 green:68/255.0 blue:128/255.0 alpha:1];
    [self.view addSubview:mcLab];
    _menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStyleGrouped];
    
    _menuTableView.backgroundView = nil;
    _menuTableView.backgroundView = [[UIView alloc] init];
    _menuTableView.backgroundView.backgroundColor = [UIColor clearColor];
    _menuTableView.backgroundColor = [UIColor clearColor];
    
    _menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _menuTableView.delegate = self;
    _menuTableView.dataSource = self;
    _menuTableView.tableFooterView = [[UIView alloc] init];
    
    self.view.frame = CGRectMake(0, 0, 320 * 0.78, SCREEN_HEIGHT);
    
    [self.view addSubview:_menuTableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 115;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView* avatarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 75)];
    [avatarView addSubview:_avatarBtn];
    [avatarView addSubview:mcLab];
    [avatarView addSubview:yxLab];
    return avatarView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _menus.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellId = @"cellId";
    UITableViewCell * cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
          cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    Menu *menu = _menus[indexPath.row];
    cell.textLabel.text = menu.title;
    return cell;
}

#pragma mark - 选择左侧菜单
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Menu * menu = _menus[indexPath.row];
    NSLog(@"选择菜单：%@", menu.title);
    [self.delegate didSelectItem:menu];
}

#pragma mark - 旅客中心的点击事件
-(void) avatarClick {
    [self.delegate didSelectHeader];
}

@end
