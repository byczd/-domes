//
//  ViewController.m
//  测试静态库
//
//  Created by wumeng on 2018/1/4.
//  Copyright © 2018年 wumeng. All rights reserved.
//

#import "ViewController.h"

#import <FrameworkeLib/Test.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[Test alloc] testMethod];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
