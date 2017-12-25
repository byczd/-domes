//
//  ViewController.m
//  testMasnory
//
//  Created by wumeng on 2017/12/18.
//  Copyright © 2017年 wumeng. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "View+MASAdditions.h"
#import "UIView+Mss.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectZero];
    testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:testView];
    
    [testView test];
    
    [testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(100);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
