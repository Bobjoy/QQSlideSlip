//
//  Menu.m
//  AugsVetechB2G
//
//  Created by Vetech on 15/10/13.
//  Copyright © 2015年 doniel. All rights reserved.
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
