//
//  Menu.h
//  QQSideSlip
//
//  Created by Bobjoy on 15/11/10.
//  Copyright © 2015年 BFL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Menu : NSObject

@property(nonatomic, assign) NSInteger index;
@property(nonatomic, assign) NSString *title;
@property(nonatomic, assign) NSString *icon;

- (id)initWithIndex:(NSInteger)index andTitle:(NSString *)title andIcon:(NSString *)icon;

@end
