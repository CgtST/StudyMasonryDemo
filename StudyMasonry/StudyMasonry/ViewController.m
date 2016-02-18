//
//  ViewController.m
//  StudyMasonry
//
//  Created by Mac on 16/2/18.
//  Copyright © 2016年 st. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    [self exp1];
    //    [self exp2];
    [self exp3];
}

//注意点1： 使用 mas_makeConstraints方法的元素必须事先添加到父元素的中，例如[self.view addSubview:view];
//中心点与self.view相同，宽度为400*400
- (void)exp1{
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
}

//上下左右边距都为10
- (void)exp2{
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).and.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}

//让两个高度为150的view垂直居中且等宽且等间隔排列，间隔为10
- (void)exp3
{
    UIView * view1 = [UIView new];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    UIView * view2 = [UIView new];
    view2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view2];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(view2.mas_width);
        make.left.mas_equalTo(self.view.mas_left).with.offset(10);
        make.right.mas_equalTo(view2.mas_left).offset(-10);
    }];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(view1.mas_width);
        make.left.mas_equalTo(view1.mas_right).with.offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
