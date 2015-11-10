//
//  CATransform3DPerspect.h
//  IOS_3D_UI
//
//  Created by adam.worldmatrix@gmail.com on 9/25/12.
//  Copyright (c) 2012 WorldMatrix. All rights reserved.
//

/**
 *  构造CALayer的透视投影矩阵
 *  center : 相机相对于CALayer的平面位置
 *  disZ   : 相机与z=0投影平面的距离
 */

CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ);
CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ);