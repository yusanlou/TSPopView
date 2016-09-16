//
//  ViewController.m
//  popView
//
//  Created by BackNotGod on 16/9/15.
//  Copyright © 2016年 BackNotGod. All rights reserved.
//

#import "ViewController.h"
#import "TSLMenuManager.h"
#import "TSLMenuView.h"
@interface ViewController ()<TSLMenuViewDataSource,TSLMenuViewDataDelegate>


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   
    
    [TSLMenuManager showMenuWith:self.view delegate:self originPoint:self.view.center cornerPoint:CGPointZero size:CGSizeMake(100, 200) option:TSPOPOPTIONMIDDLE];
}

-(NSInteger)numberOfRows{
    return 5;
}

-(UIButton*)itemForIndexPath:(NSInteger)index{
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:[NSString stringWithFormat:@"%ld",(long)index] forState:UIControlStateNormal];
    return button;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
