//
//  BackLayer.m
//  popView
//
//  Created by BackNotGod on 16/9/15.
//  Copyright © 2016年 BackNotGod. All rights reserved.
//

#import "BackLayer.h"

@interface BackLayer()

@end

@implementation BackLayer

-(instancetype)init{
    
    if (self = [super init]) {
        
    }
    return self;
}



/**
 *  绘制图层
 */

-(void)drawInContext:(CGContextRef)ctx{
 
    /**
     *  三个预设的位置
     */
    if (self.option != TSPOPOPTIONNONE) {
        switch (self.option) {
            case TSPOPOPTIONNONE:
                break;
            case TSPOPOPTIONMIDDLE: {
                self.cornerPoint = self.position;
                break;
            }
            case TSPOPOPTIONLEFT: {
                self.cornerPoint = CGPointMake(cornerOffset, 0);
                break;
            }
            case TSPOPOPTIONRIGHT: {
                self.cornerPoint = CGPointMake(self.bounds.size.width - cornerOffset, 0);
                break;
            }
        }
        
    }

    
    // 小角
    UIBezierPath* path = [UIBezierPath bezierPath];
    CGPoint leftPoint = CGPointMake(self.cornerPoint.x - Corner_Width, Corner_Height);
    CGPoint topPoint  = CGPointMake(self.cornerPoint.x, 0);
    CGPoint rightPoint = CGPointMake(self.cornerPoint.x + Corner_Width, Corner_Height);
    
    // 边框
    CGPoint t_0 = CGPointMake(0 , Corner_Height);
    CGPoint t_1 = CGPointMake(self.bounds.size.width, Corner_Height);
    
    CGPoint b_0 = CGPointMake(0, self.bounds.size.height);
    CGPoint b_1 = CGPointMake(self.bounds.size.width, self.bounds.size.height);
    
    // 圆角
    CGPoint t_0_1 = CGPointMake(t_0.x, t_0.y + cornerRadius);
    CGPoint t_0_2 = CGPointMake(t_0.x + cornerRadius, t_0.y);
    CGPoint t_1_1 = CGPointMake(t_1.x, t_1.y + cornerRadius);
    CGPoint t_1_2 = CGPointMake(t_1.x - cornerRadius, t_1.y);
    CGPoint b_0_1 = CGPointMake(b_0.x, b_0.y - cornerRadius);
    CGPoint b_0_2 = CGPointMake(b_0.x + cornerRadius, b_0.y);
    CGPoint b_1_1 = CGPointMake(b_1.x, b_1.y - cornerRadius);
    CGPoint b_1_2 = CGPointMake(b_1.x - cornerRadius, b_1.y);

    [path moveToPoint:leftPoint];
    [path addLineToPoint:topPoint];
    [path addLineToPoint:rightPoint];

    [path addLineToPoint:t_1_2];
    [path addQuadCurveToPoint:t_1_1 controlPoint:t_1];
    [path addLineToPoint:b_1_1];
    [path addQuadCurveToPoint:b_1_2 controlPoint:b_1];
    [path addLineToPoint:b_0_2];
    [path addQuadCurveToPoint:b_0_1 controlPoint:b_0];
    [path addLineToPoint:t_0_1];
    [path addQuadCurveToPoint:t_0_2 controlPoint:t_0];
    [path addLineToPoint:leftPoint];
    [path closePath];
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextSetFillColorWithColor(ctx,[[UIColor blackColor] colorWithAlphaComponent:0.8].CGColor);
    CGContextFillPath(ctx);


}

@end
