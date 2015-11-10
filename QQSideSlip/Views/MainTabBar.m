//
//  MyNBTabBar.m
//  NB2
//
//  Created by kohn on 13-11-16.
//  Copyright (c) 2013年 Kohn. All rights reserved.
//

#import "MainTabBar.h"
#import "MainTabButton.h"

#define HEIGHT_MENU_VIEW ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? 60 : 65)
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface MainTabBar()

@property (strong) NSMutableArray *buttons;
@property (strong) NSMutableArray *buttonData;

@property(nonatomic, strong)NSMutableArray *btnImgViewArray;

- (void)setupButtons;

@end

@implementation MainTabBar
@synthesize buttons = _buttons, buttonData = _buttonData, delegate;

- (id)initWithItems:(NSArray *)items {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, SCREEN_HEIGHT - HEIGHT_MENU_VIEW, SCREEN_WIDTH, 61);
        self.backgroundColor = [UIColor blackColor];
        
        self.buttonData = [[NSMutableArray alloc]initWithArray:items];
        self.buttons = [[NSMutableArray alloc]init];
        
        [self setupButtons];
    }
    return self;
}
- (void)setupButtons {
    _btnImgViewArray  = [[NSMutableArray alloc]init];
    NSInteger count = 0;
    NSInteger xExtra = 0;
    NSInteger buttonSize = floor(SCREEN_WIDTH / [self.buttonData count]) -1;
    for (MainTabButton *info in self.buttonData) {
        //NSInteger extra = 0;
        if ([self.buttonData count] % 2 == 1) {
            if ([self.buttonData count] == 5) {
                NSInteger i = (count +1) + (floor([self.buttonData count] / 2));
                if (i == [self.buttonData count]) {
                    //extra = 1;
                }else if([self.buttonData count] == 3){
                    buttonSize = floor(SCREEN_WIDTH / [self.buttonData count]);
                }
            }else{
                if (count + 1 == 2) {
                    //extra = 1;
                } else if (count + 1 == 3) {
                    xExtra = 1;
                }
            }
        }
        NSInteger buttonX = (count * buttonSize) +count+xExtra;
        
        UIButton *tabButton = [UIButton buttonWithType:UIButtonTypeCustom];
        tabButton.frame  = CGRectMake(buttonX, 2, buttonSize+xExtra, 43);
        
        UIImageView *btnImgView = [[UIImageView alloc]initWithImage:[info icon]];

        [_btnImgViewArray addObject:btnImgView];
        float y = 15;
        float width = 30;
        float height = 25;
        if (count == 1) {
            y = 0;
            width = 40;
            height = width;
        }
        float x = (buttonSize - width)/2;
        if (count == 1) {
            x = x + 2;
        }
        
        btnImgView.frame = CGRectMake(x, y, width, height);
        [tabButton addSubview:btnImgView];
        
        [tabButton setTitle:info.text forState:UIControlStateNormal];
        [tabButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [tabButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [tabButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
        //[tabButton setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];//设置title在button被选中情况下为灰色字体
        tabButton.titleEdgeInsets = UIEdgeInsetsMake(55, 1, 0, 0);//设置title在button上的位置（上top，左left，下bottom，右right）
        
        [tabButton addTarget:self action:@selector(touchDownForButton:) forControlEvents:UIControlEventTouchDown];
        [tabButton addTarget:self action:@selector(touchUpForButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:tabButton];
        [self.buttons addObject:tabButton];
        count++;
    }
}

//- (void)showDefauls {
//    [self touchDownForButton:[self.buttons objectAtIndex:0]];
//    [self touchUpForButton:[self.buttons objectAtIndex:0]];
//}
//- (void)showIndex:(NSInteger) index{
//    [self touchDownForButton:[self.buttons objectAtIndex:index]];
//    [self touchUpForButton:[self.buttons objectAtIndex:index]];
//}

- (void)touchDownForButton:(UIButton *)button{
    button.selected = YES;
    NSInteger i = [self.buttons indexOfObject:button];
    
    //MainTabController *vc = [[self.buttonData objectAtIndex:i] viewController];
    //[delegate switchViewController:vc];
    
    [delegate tabBar:self.buttonData[i]];
    
    for (UIButton *b in self.buttons) {
        for (UIView *aView in [b subviews]) {
            if ([aView isKindOfClass:[UIImageView class]]) {
                UIImageView * imgView = (UIImageView *)aView;
                imgView.highlighted = NO;
            }
        }
    }
    for (UIView *aView in [button subviews]) {
        if ([aView isKindOfClass:[UIImageView class]]) {
            UIImageView * imgView = (UIImageView *)aView;
            imgView.highlighted = YES;
        }
    }
    
    for (UIButton * b in self.buttons) {
        b.selected = NO;
    }
    
}
- (void)touchUpForButton:(UIButton *)button {
    for (UIButton *b in self.buttons) {
        for (UIView *aView in [b subviews]) {
            if ([aView isKindOfClass:[UIImageView class]]) {
                UIImageView * imgView = (UIImageView *)aView;
                imgView.highlighted = NO;
            }
        }
    }
    for (UIView *aView in [button subviews]) {
        if ([aView isKindOfClass:[UIImageView class]]) {
            UIImageView * imgView = (UIImageView *)aView;
            imgView.highlighted = YES;
        }
    }
    
    for (UIButton * b in self.buttons) {
        b.selected = NO;
    }
    button.selected = YES;
}


-(void)headImage:(UIImage *)image{
    if (_btnImgViewArray.count == 3) {
        UIImageView *imageView = _btnImgViewArray[1];
        imageView.image = image;
        imageView.layer.cornerRadius = 20;
        imageView.layer.masksToBounds = YES;
    }
}


@end
