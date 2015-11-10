//
//  Menu.h
//  AugsVetechB2G
//
//  Created by Vetech on 15/10/13.
//  Copyright © 2015年 doniel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Menu : NSObject

@property(nonatomic, assign) NSInteger index;
@property(nonatomic, assign) NSString *title;
@property(nonatomic, assign) NSString *icon;

- (id)initWithIndex:(NSInteger)index andTitle:(NSString *)title andIcon:(NSString *)icon;

@end
