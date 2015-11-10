//
//  MyNBTabButton.m
//  NB2
//
//  Created by kohn on 13-11-16.
//  Copyright (c) 2013年 Kohn. All rights reserved.
//

#import "MainTabButton.h"

@implementation MainTabButton
@synthesize text = _text, icon, highlightedIcon;

- (id)initWithIcon:(UIImage *)aIcon andText:(NSString *)aText {
    self = [super init];
    if (self) {
        self.icon = aIcon;
        self.text = aText;
    }
    return self;
}
//- (void)setViewController:(MainTabController *)viewController {
//    _viewController = viewController;
//    self.viewController.tabBarButton = self;
//}

@end
