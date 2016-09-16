//
//  TSLMenuManager.h
//  popView
//
//  Created by BackNotGod on 16/9/15.
//  Copyright © 2016年 BackNotGod. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSUInteger,TSPOPOPTION){
    TSPOPOPTIONNONE,
    TSPOPOPTIONMIDDLE,
    TSPOPOPTIONLEFT,
    TSPOPOPTIONRIGHT,
};

@protocol TSLMenuViewDataSource <NSObject>
@required
-(NSInteger)numberOfRows;
-(UIButton*)itemForIndexPath:(NSInteger)index;

@end

@protocol TSLMenuViewDataDelegate <NSObject>
@optional
-(void)didSeletedAtIndexPath:(NSInteger)index;

@end

@interface TSLMenuManager : NSObject

/**
 *
 *
 *  @param view   要显示在那个view上
 *  @param originPoint  控制弹出的位置
 *  @param point  从哪个view上弹出 控制角的位置 【0 , 0 ~ size.width】
 *  @param size   设置popview的size
 *  @param option 可以不设置point，直接用预设的三个位置 【left middle right】
 */
+(void)showMenuWith:(UIView*)view delegate:(id)target originPoint:(CGPoint)originPoint  cornerPoint:(CGPoint)point size:(CGSize)size option:(TSPOPOPTION)option;



+(void)showMenuWith:(UIView *)view delegate:(id)target originPoint:(CGPoint)originPoint size:(CGSize)size option:(TSPOPOPTION)option;

+(void)showMenudelegate:(id)target originPoint:(CGPoint)originPoint size:(CGSize)size option:(TSPOPOPTION)option;

+(void)showdelegate:(id)target originPoint:(CGPoint)originPoint cornerPoint:(CGPoint)point size:(CGSize)size option:(TSPOPOPTION)option;

@end
