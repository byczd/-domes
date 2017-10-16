//
//  ViewController.m
//  10月16版本新功能测试dome
//
//  Created by wumeng on 2017/10/10.
//  Copyright © 2017年 wumeng. All rights reserved.
//

#import "ViewController.h"
#import "AlertForFutouView.h"

@interface ViewController ()

@end

@implementation ViewController{
    AlertForFutouView *_alertView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    

}


- (void)viewDidAppear:(BOOL)animated{
    _alertView = [[AlertForFutouView alloc] init];
    [_alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_alertView show];
}

@end
