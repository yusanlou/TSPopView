//
//  TSLMenuView.m
//  popView
//
//  Created by BackNotGod on 16/9/15.
//  Copyright © 2016年 BackNotGod. All rights reserved.
//

#import "TSLMenuView.h"
#import "BackLayer.h"
#import <Masonry.h>
#import <pop/POP.h>


@interface TSLMenuView ()
{
    BackLayer* _layer;
}


@end

@implementation TSLMenuView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

-(void)ConstraintsItems{
    
    NSInteger count = [self.dataSource numberOfRows];
    UIView* lastView = [UIView new];
    for (int i = 0; i < count;  i ++) {
        
        UIButton* buttonItem = [self.dataSource itemForIndexPath:i];
        [self addSubview:buttonItem];
        // 这里只关心布局，图片和文字的摆放自定义
        [buttonItem mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.top.equalTo(self.mas_top).offset(1+Corner_Height);
            }else{
                make.top.equalTo(lastView.mas_bottom).offset(0);
            }
            make.left.equalTo(self.mas_left).offset(1);
            make.right.equalTo(self.mas_right).offset(-1);
            make.height.equalTo(@((self.bounds.size.height-Corner_Height-count)/count));
        }];
        buttonItem.titleLabel.textAlignment = NSTextAlignmentLeft;
//        [buttonItem setBackgroundImage:[UIImage imageWithColor:[UIColor blackColor]] forState:UIControlStateHighlighted];
        [buttonItem addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        buttonItem.tag = i + 9000;
        [buttonItem setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
        if (i < count - 1) {
            // 分割线
            UIView* line = [UIView new];
            line.backgroundColor = [UIColor whiteColor];
            [self addSubview:line];
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).offset(10);
                make.right.equalTo(self.mas_right).offset(-10);
                make.height.equalTo(@carveLineWith);
                make.top.equalTo(buttonItem.mas_bottom);
            }];
            lastView = line;
        }
    }
    
}


-(void)willMoveToSuperview:(UIView *)newSuperview{
    
    
    _layer = [BackLayer layer];
    _layer.cornerPoint = self.cornerPoint;
    _layer.option = self.option;
    _layer.frame = self.layer.bounds;
    _layer.contentsScale = [UIScreen mainScreen].scale;
    [self.layer addSublayer:_layer];
    [_layer setNeedsDisplay];
    
    [self ConstraintsItems];
    
}

-(void)buttonClick:(UIButton*)sender{
    
    NSInteger tag = sender.tag;
    if ([self.delegate respondsToSelector:@selector(didSeletedAtIndexPath:)]) {
        [self.delegate didSeletedAtIndexPath:tag-9000];
    }
    [self removeFromSuperview];
}

-(void)removeFromSuperview{
   
    self.layer.position = CGPointMake(self.frame.origin.x + _layer.cornerPoint.x, self.frame.origin.y);
    self.layer.anchorPoint = CGPointMake(_layer.cornerPoint.x/self.bounds.size.width, 0);
    POPSpringAnimation* anim_a = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];

    anim_a.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    anim_a.springSpeed = 18;
    [self pop_addAnimation:anim_a forKey:@"scal_rm"];
    DEF_WEAKSELF
    [anim_a setCompletionBlock:^(POPAnimation *anim, BOOL finish) {
        if (finish) {
            [weakSelf.mask removeFromSuperview];
            [super removeFromSuperview];
        }
    }];

}

-(void)dealloc{
    
}

@end
