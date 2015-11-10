//
//  Menu.m
//  QQSideSlip
//
//  Created by Bobjoy on 15/11/10.
//  Copyright © 2015年 BFL. All rights reserved.
//

#import "Menu.h"

@implementation Menu

- (id)initWithIndex:(NSInteger)index andTitle:(NSString *)title andIcon:(NSString *)icon {
    self = [super init];
    if (self) {
        self.index = index;
        self.title = title;
        self.icon = icon;
    }
    return self;
}

@end
