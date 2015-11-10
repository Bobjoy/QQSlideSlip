//
//  MainTabButton.h
//  QQSideSlip
//
//  Created by Bobjoy on 15/11/10.
//  Copyright © 2015年 BFL. All rights reserved.
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
