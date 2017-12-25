//
//  ViewController.m
//  testDemo
//
//  Created by wumeng on 2017/12/8.
//  Copyright © 2017年 wumeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    __weak IBOutlet UIButton *btn;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image  =[UIImage imageNamed:@"120.png"];
    //image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [btn setImage:image forState:UIControlStateNormal];
    btn.imageEdgeInsets=UIEdgeInsetsMake(10, 0, 10, 200);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
