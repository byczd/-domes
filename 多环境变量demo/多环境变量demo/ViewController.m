//
//  ViewController.m
//  多环境变量demo
//
//  Created by wumeng on 2018/5/2.
//  Copyright © 2018年 wumeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20.f, 60.f, 100.f, 50.f)];
    
    label.font = [UIFont systemFontOfSize:25];
    label.backgroundColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blueColor];
    
    label.numberOfLines = 2;
    label.shadowColor = [UIColor redColor];
    label.shadowOffset = CGSizeMake(-3, -3);
    
    
#if DEBUG2
    label.text = @"马甲包";
    
#else
    label.text = @"主包";
#endif
    
    [label sizeToFit];
    [self.view addSubview:label];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
