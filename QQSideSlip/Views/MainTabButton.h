//
//  MyNBTabButton.h
//  NB2
//
//  Created by kohn on 13-11-16.
//  Copyright (c) 2013年 Kohn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MainTabButton : NSObject {
    UIImage *icon;
    UIImage *highlightedIcon;
    NSString *text;
}
@property (nonatomic,strong) UIImage *icon;
@property (nonatomic,strong) UIImage *highlightedIcon;
@property (nonatomic,strong) NSString *text;
@property (nonatomic) NSInteger tag;

- (id)initWithIcon:(UIImage *)icon andText:(NSString *)text;

@end
