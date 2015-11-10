//
//  UIViewExt.h
//  QQSideSlip
//
//  Created by Bobjoy on 15/11/10.
//  Copyright © 2015年 BFL. All rights reserved.
//

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)
@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;//高
@property CGFloat width;//宽

@property CGFloat top;//上
@property CGFloat left;//左

@property CGFloat bottom;//下
@property CGFloat right;//右

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;
@end