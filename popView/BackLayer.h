//
//  BackLayer.h
//  popView
//
//  Created by 李军杰 on 16/9/15.
//  Copyright © 2016年 李军杰. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "TSLMenuManager.h"
// 小角的宽高
#define Corner_Height 7
#define Corner_Width  5
// 圆角
#define cornerRadius  4
// 小角的偏移量
#define cornerOffset  15
// 分割线
#define carveLineWith  (1 / [UIScreen mainScreen].scale)

#define DEF_WEAKSELF    __weak __typeof(self) weakSelf = self;

@interface BackLayer : CAShapeLayer

@property(nonatomic)TSPOPOPTION option;

@property(nonatomic)CGPoint cornerPoint;

@end
