//
//  ViewController.m
//  单元测试demo
//
//  Created by wumeng on 2018/5/4.
//  Copyright © 2018年 wumeng. All rights reserved.
//

#import "ViewController.h"
#import <XGSDK/XGSDK.h>
#import "GameDetailVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}

- (IBAction)loginAction:(id)sender {
    __weak __typeof(self)weakSelf = self;
    [XGSDKManager.manager XGSDKloginWithSuccess:^(XGLoginCallbackModel *model) {
        NSLog(@"%@-%@-%@",model.username,model.userid,model.session);
        GameDetailVC *gameDetailVC = [[GameDetailVC alloc] init];
        [weakSelf.navigationController pushViewController:gameDetailVC animated:YES];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}


- (IBAction)checkStatusAction:(id)sender {
    
    
}


@end
