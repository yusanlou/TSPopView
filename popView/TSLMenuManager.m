//
//  TSLMenuManager.m
//  popView
//
//  Created by BackNotGod on 16/9/15.
//  Copyright © 2016年 BackNotGod. All rights reserved.
//

#import "TSLMenuManager.h"
#import "TSLMenuView.h"
#import "BackLayer.h"

@implementation TSLMenuManager

+(void)showMenuWith:(UIView *)view delegate:(id)target originPoint:(CGPoint)originPoint size:(CGSize)size option:(TSPOPOPTION)option{
    [TSLMenuManager showMenuWith:view delegate:target originPoint:originPoint cornerPoint:CGPointZero size:size option:option];
}

+(void)showMenudelegate:(id)target originPoint:(CGPoint)originPoint size:(CGSize)size option:(TSPOPOPTION)option{
    [TSLMenuManager showMenuWith:[[UIApplication sharedApplication] keyWindow] delegate:target originPoint:originPoint size:size option:option];
}

+(void)showdelegate:(id)target originPoint:(CGPoint)originPoint cornerPoint:(CGPoint)point size:(CGSize)size option:(TSPOPOPTION)option{
    [TSLMenuManager showMenuWith:[[UIApplication sharedApplication] keyWindow] delegate:target originPoint:originPoint cornerPoint:CGPointZero size:size option:option];
}



+(void)showMenuWith:(UIView*)view delegate:(id)target originPoint:(CGPoint)originPoint  cornerPoint:(CGPoint)point size:(CGSize)size option:(TSPOPOPTION)option{

    // MASK
    UIView * mask = [UIView new];
    mask.frame = view.bounds;
    [view addSubview:mask];
    
    TSLMenuView* menu = [[TSLMenuView alloc]init];
    menu.frame = (CGRect){originPoint,size};
    menu.alpha = 0;
    menu.cornerPoint = point;
    menu.option = option;
    menu.delegate = target;
    menu.dataSource = target;
    menu.mask = mask;
    [view addSubview:menu];
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        menu.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:menu action:@selector(removeFromSuperview)];
    [mask addGestureRecognizer:tap];

}

@end
