//
//  MainViewController.m
//  QQSideSlip
//
//  Created by Bobjoy on 15/11/10.
//  Copyright © 2015年 BFL. All rights reserved.
//


#import "MainViewController.h"
#import "HomeViewController.h"
#import "MainTabButton.h"
#import "MainTabBar.h"
#import "MenuViewController.h"
#import "CATransform3DPerspect.h"

typedef enum state {
    kStateHome,
    kStateMenu
}state;

static const CGFloat viewSlideHorizonRatio = 0.75;
static const CGFloat viewHeightNarrowRatio = 0.80;
static const CGFloat menuStartNarrowRatio  = 0.70;

@interface MainViewController () <UIActionSheetDelegate, MenuViewControllerDelegate, MainTabBarDelegate>
{
    UILabel *badgeLabel;
}
@property (assign, nonatomic) state   sta;              // 状态(Home or Menu)
@property (assign, nonatomic) CGFloat distance;         // 距离左边的边距
@property (assign, nonatomic) CGFloat leftDistance;
@property (assign, nonatomic) CGFloat menuCenterXStart; // menu起始中点的X
@property (assign, nonatomic) CGFloat menuCenterXEnd;   // menu缩放结束中点的X
@property (assign, nonatomic) CGFloat panStartX;        // 拖动开始的x值

@property (strong, nonatomic) HomeViewController     *homeVC;
@property (strong, nonatomic) MenuViewController   *menuVC;

@property (strong, nonatomic) UIView * cover;

@property (strong, nonatomic) MainTabButton *personTabBar;      //个人中心头像按钮
@property (nonatomic, strong) NSMutableArray *messageListArray;



@end

@implementation MainViewController {
    
    // 主界面
    UIView *_mainView;
    // 导航栏
    UIView *_navView;
    // 导航栏左侧菜单按钮
    UIButton *_leftBtn;
    // 导航栏右侧消息按钮
    UIButton *_rightBtn;
    // 选项卡
    MainTabBar *_tabBar;
    // 主界面点击手势，用于在菜单划出状态下点击主页后自动关闭菜单
    UITapGestureRecognizer* _tapGesture;
    // 是否已经显示菜单
    BOOL isShowed;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 初始化主视图，即包含 TabBar、NavigationBar和首页的总视图
    _mainView = [[UIView alloc] initWithFrame: self.view.frame];
    _mainView.backgroundColor = RGB(247,243,243);
    
    // 左侧菜单视图
    [self createLeftViews];
    
    // 头部导航栏
    [self createTopViews];
    [_mainView bringSubviewToFront:_navView];
    
    // 主界面视图
    [self createCenterViews];
    
    // 底部选项卡
    [self createBottomViews];
    [_mainView bringSubviewToFront:_tabBar];
    
    // 设置手势
    [self setupGestureRecognizer];
    
    [self.view addSubview:_mainView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [_menuVC.avatarBtn setImage:[[UIImage alloc] init] forState:UIControlStateNormal];
     _menuVC.menus = @[
              [[Menu alloc] initWithIndex:0  andTitle:@"开通会员" andIcon:@"iia"],
              [[Menu alloc] initWithIndex:1 andTitle:@"QQ钱包" andIcon:@"lep"],
              [[Menu alloc] initWithIndex:2 andTitle:@"个性装扮" andIcon:@"fbb"],
              [[Menu alloc] initWithIndex:3 andTitle:@"我的收藏" andIcon:@"gxn"],
              [[Menu alloc] initWithIndex:4 andTitle:@"我的相册" andIcon:@"leo"],
              [[Menu alloc] initWithIndex:5 andTitle:@"我的文件" andIcon:@"lep"]
              ];
    [_menuVC.menuTableView reloadData];
    
}

#pragma mark - 设置左侧菜单视图

- (void)createLeftViews {
    self.sta = kStateHome;
    self.distance = 0;
    self.menuCenterXStart = SCREEN_WIDTH * menuStartNarrowRatio / 2.0;
    self.menuCenterXEnd = self.view.center.x;
    self.leftDistance = SCREEN_WIDTH * viewSlideHorizonRatio;
    
    // 设置menu的view
    _menuVC = [[MenuViewController alloc] init];
    _menuVC.delegate = self;
    _menuVC.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"knv"]];
    _menuVC.view.backgroundColor = [UIColor cyanColor];
    _menuVC.view.frame = [[UIScreen mainScreen] bounds];
    _menuVC.view.layer.zPosition = -11;
    _menuVC.view.center = CGPointMake(self.menuCenterXStart, _menuVC.view.center.y);
    [self.view addSubview:_menuVC.view];
    
    // 在侧滑菜单之上增加黑色遮罩层，目的是实现视差特效
    _cover = [[UIView alloc] initWithFrame: CGRectOffset(self.view.frame, 0, 0)];
    _cover.backgroundColor = [UIColor blackColor];
    _cover.layer.zPosition = -10;
   [self.view addSubview: _cover];
}

- (void)createTopViews {
    // 导航栏
    _navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAVI_HEIGHT)];
    _navView.backgroundColor = RGB(67, 187, 230);
    
    // 导航左侧菜单按钮
    _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, VIEW_W(self.view)/7.5, 44)];
    [_leftBtn addTarget:self action:@selector(menuClicked) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:_leftBtn];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"gco"]];
    imageView.frame = CGRectMake(10, 20+(44-32)/2.0, 32, 32);
    [_navView addSubview:imageView];
    
    // 导航右侧消息按钮
    _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-44, imageView.frame.origin.y, 32, 32)];
    [_rightBtn setImage:[UIImage imageNamed:@"ied"] forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(messageBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:_rightBtn];
    
    [_mainView addSubview:_navView];
}


#pragma mark - 设置中间轮播、列表视图
- (void)createCenterViews {
    // 主页视图控制器
    _homeVC = [[HomeViewController alloc]init];
    _homeVC.view.frame = CGRectMake(0, NAVI_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-NAVI_HEIGHT);
    _homeVC.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:_homeVC];
    [_mainView addSubview:_homeVC.view];
}

#pragma mark - 设置底部选项卡视图

- (void)createBottomViews {
    // 主页视图控制器选项卡
    MainTabButton *homeTabBar = [[MainTabButton alloc] initWithIcon:[UIImage imageNamed:@"home"] andText:@"首页"];
    homeTabBar.tag = 200;
    // 个人中心视图控制器选项卡
    _personTabBar = [[MainTabButton alloc] init];
    _personTabBar.tag = 201;
    // 在线客服视图控制器选项卡
    MainTabButton *serviceTabBar = [[MainTabButton alloc] initWithIcon:[UIImage imageNamed:@"phone"] andText:@"在线客服"];
    serviceTabBar.tag = 202;
    _tabBar = [[MainTabBar alloc] initWithItems:@[homeTabBar, _personTabBar, serviceTabBar]];
    _tabBar.backgroundColor = RGB(247,243,243);
    _tabBar.delegate = self;
    _tabBar.backgroundColor = [UIColor whiteColor];
    _tabBar.userInteractionEnabled = YES;
    
    [_mainView addSubview:_tabBar];
    
}

#pragma mark - 点击菜单按钮
- (void)menuClicked {
    self.cover.alpha = 0;
    self.cover.frame = self.view.frame;
    if (isShowed) {
        [self showHome];
    } else {
        [self showMenu];
    }
}

#pragma mark - 设置侧滑手势、点击手势
- (void)setupGestureRecognizer {
    
    //给左边视图绑定 UIPanGestureRecognizer
    UIPanGestureRecognizer* menuPanGesture = [[UIPanGestureRecognizer alloc] init];
    [menuPanGesture addTarget: self action: @selector(handlePan:)];
    [self.menuVC.view addGestureRecognizer: menuPanGesture];
    
    // 给主视图绑定滑动手势
    self.panGesture = [[UIPanGestureRecognizer alloc] init];
    [self.panGesture addTarget: self action: @selector(handlePan:)];
    [_mainView addGestureRecognizer: self.panGesture];
    
    // 生成单击收起菜单手势
    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showHome)];
}

#pragma mark - 底部选项卡选择
- (void)tabBar:(MainTabButton *)tabBarButton {
    NSLog(@"%ld", (long)tabBarButton.tag);
    switch (tabBarButton.tag) {
        case 200:
            NSLog(@"首页");
            break;
        case 201:
            NSLog(@"个人中心");
            break;
        case 202:
            NSLog(@"拨打电话");
            break;
        default:
            break;
    }
}

#pragma mark - 处理滑动事件
- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    // 当滑动水平X大于75时禁止滑动
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.panStartX = [recognizer locationInView:self.view].x;
    }
    // 如果当前显示的是主页，且滑动的起始位置x坐标（距离屏幕左侧边缘）大于75，则不执行动画
    if (self.sta == kStateHome && self.panStartX >= 160) {
        return;
    }
    
    CGFloat x = [recognizer translationInView:self.view].x;
    // 禁止在主界面的时候向左滑动
    if (self.sta == kStateHome && x < 0) {
        return;
    }
    
    CGFloat dis = self.distance + x;
    // 当手势停止时执行操作
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if (dis >= SCREEN_WIDTH * viewSlideHorizonRatio / 2.0) {
            [self showMenu];
        } else {
            [self showHome];
        }
        return;
    }
    
    CGFloat proportion = (viewHeightNarrowRatio - 1) * dis / self.leftDistance + 1;
    if (proportion < viewHeightNarrowRatio || proportion > 1) {
        return;
    }
    _mainView.center = CGPointMake(self.view.center.x + dis, self.view.center.y);
    _mainView.transform = CGAffineTransformScale(CGAffineTransformIdentity, proportion, proportion);
    
    self.cover.alpha = 1 - dis / self.leftDistance;
    
    CGFloat menuProportion = dis * (1 - menuStartNarrowRatio) / self.leftDistance + menuStartNarrowRatio;
    CGFloat menuCenterMove = dis * (self.menuCenterXEnd - self.menuCenterXStart) / self.leftDistance;
    self.menuVC.view.center = CGPointMake(self.menuCenterXStart + menuCenterMove, self.view.center.y);
    self.menuVC.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, menuProportion, menuProportion);
    
    [self mainViewTransform:(M_PI/8) * (dis/375)];
}

#pragma mark - 主视图缩放动画
- (void)mainViewTransform:(CGFloat)angle {
    CATransform3D rotationTransform = CATransform3DMakeRotation(angle, 0, 1, 0);
    _mainView.layer.transform = CATransform3DPerspect(rotationTransform, CGPointMake(0, 0), -500);
}

#pragma mark - 展示侧边栏
- (void)showMenu {
    // 给首页 加入 点击自动关闭侧滑菜单功能
    [_mainView addGestureRecognizer:_tapGesture];
    self.distance = self.leftDistance;
    NSLog(@"%f", self.distance);
    self.sta = kStateMenu;
    [self doSlide:viewHeightNarrowRatio];
    
    // 主页视图旋转
    [self mainViewTransform:M_PI/8];
    
    isShowed = YES;
}

#pragma mark - 展示主界面
- (void)showHome {
    // 给首页 加入 点击自动关闭侧滑菜单功能
    [_mainView addGestureRecognizer:_tapGesture];
    self.distance = 0;
    self.sta = kStateHome;
    [self doSlide:1];
    
    isShowed = NO;
    // 主页视图旋转
    [self mainViewTransform:0];
}

/**
 *  实施自动滑动
 *
 *  @param proportion 滑动比例
 */
- (void)doSlide:(CGFloat)proportion {
    [UIView animateWithDuration:0.3 animations:^{
        _mainView.center = CGPointMake(self.view.center.x + self.distance, self.view.center.y);
        _mainView.transform = CGAffineTransformScale(CGAffineTransformIdentity, proportion, proportion);
        
        _leftBtn.alpha = self.cover.alpha = proportion == 1 ? 1 : 0;
        
        CGFloat menuCenterX;
        CGFloat menuProportion;
        if (proportion == 1) {
            menuCenterX = self.menuCenterXStart;
            menuProportion = menuStartNarrowRatio;
        } else {
            menuCenterX = self.menuCenterXEnd;
            menuProportion = 1;
        }
        self.menuVC.view.center = CGPointMake(menuCenterX, self.view.center.y);
        self.menuVC.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, menuProportion, menuProportion);
        
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - HomeViewController代理方法
- (void)leftBtnClicked {
    [self showMenu];
}

#pragma mark - MenuViewControllerDelegate 左侧菜单列表及头像点击处理
- (void)didSelectItem:(Menu *)menu {
    NSLog(@"MenuType: %@", menu.title);
}

- (void)didSelectHeader {
    //[self showHome];
    NSLog(@"点击的是个人中心");
}

//点击消息按钮
-(void)messageBtnClicked{
    NSLog(@"查看消息");
}

@end
