//
//  TSLMenuManager.m
//  popView
//
//  Created by BackNotGod on 16/9/15.
//  Copyright © 2016年 BackNotGod. All rights reserved.
//

#import "TSLMenuManager.h"
#import "TSLMenuView.h"
#import <pop/POP.h>
#import "BackLayer.h"

@implementation TSLMenuManager




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

    POPSpringAnimation* anim_a = [POPSpringAnimation animationWithPropertyNamed:kPOPViewAlpha];
    
    anim_a.fromValue = @(0.0);
    anim_a.toValue = @(1.0);
    anim_a.springSpeed = 18;
    [menu pop_addAnimation:anim_a forKey:@"alpha_anim"];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:menu action:@selector(removeFromSuperview)];
    [mask addGestureRecognizer:tap];


}

@end
