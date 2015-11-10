//
//  Common.h
//  QQSideSlip
//
//  Created by Vetech on 15/11/10.
//  Copyright © 2015年 BFL. All rights reserved.
//

#ifndef Common_h
#define Common_h

//RGB 和 RGBA
#define RGB(r, g, b)    [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBA(r, g, b, a)    [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]

#define NAVI_HEIGHT     64.0f
//屏幕的宽、高
#define SCREEN_HEIGHT   [[UIScreen mainScreen]bounds].size.height
#define SCREEN_WIDTH    [[UIScreen mainScreen]bounds].size.width

//视图的X,Y坐标
#define VIEW_X(view)    (view.frame.origin.x)
#define VIEW_Y(view)    (view.frame.origin.y)
//视图的宽,高
#define VIEW_W(view)    (view.frame.size.width)
#define VIEW_H(view)    (view.frame.size.height)
//相对于某视图的X,Y
#define VIEW_XW(view)   (view.frame.origin.x + view.frame.size.width)
#define VIEW_YH(view)   (view.frame.origin.y + view.frame.size.height)

#endif /* Common_h */
