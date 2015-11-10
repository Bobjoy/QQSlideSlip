//
//  MainTabButton.m
//  QQSideSlip
//
//  Created by Bobjoy on 15/11/10.
//  Copyright © 2015年 BFL. All rights reserved.
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

@end
