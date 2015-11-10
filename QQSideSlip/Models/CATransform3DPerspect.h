//
//  CATransform3DPerspect.h
//  QQSideSlip
//
//  Created by Bobjoy on 15/11/10.
//  Copyright © 2015年 BFL. All rights reserved.
//

/**
 *  构造CALayer的透视投影矩阵
 *  center : 相机相对于CALayer的平面位置
 *  disZ   : 相机与z=0投影平面的距离
 */

CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ);
CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ);